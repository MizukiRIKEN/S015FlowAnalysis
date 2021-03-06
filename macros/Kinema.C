void Kinema(UInt_t isel = 0)
{

  if( isel > 3 ) exit(0);

  Double_t amu  = 931.4940954; //MeV/c2  
  Double_t c    = 299792458.; //m/s                                                                 

  TString system[5];
  Double_t AB[5];
  Double_t mB[5];
  Double_t eB_lb[5];
  Double_t mT[5];     

  system[0] =  "(132Sn + 124Sn)";
  AB[0]     =  132.;
  mB[0]     =  131.8906 ; //amu                                                                 
  eB_lb[0]  =  268.9 ;    //MeV/amu; incident energy    
  mT[0]     =  123.8773895;   //amu Target mass

  system[1] = "(108Sn + 112Sn)";
  AB[1]     =  108.;
  mB[1]     =  107.8844964; //amu
  eB_lb[1]  =  268.9;
  mT[1]     =  111.8773895;;

  system[2] = "(124Sn + 112Sn)";
  AB[2]     =  124.;
  mB[2]     =  123.8778449; //amu
  eB_lb[2]  =  270.2;
  mT[2]     =  111.8773895;;

  system[3] = "(112Sn + 124Sn)";
  AB[3]     =  112.;
  mB[3]     =  111.8773895; //amu
  eB_lb[3]  =  270.2;
  mT[3]     =  123.8773895;

  system[4] = "(p + p)";
  AB[4]     = 1.;
  mB[4]     = 1.00727646688;
  eB_lb[4]  = 268.9;
  mT[4]     = 1.00727646688;
  


  for(UInt_t isys = 0; isys < 5; isys++){

    Double_t EkB_lb    = eB_lb[isys]  * mB[isys];
    mB[isys] *= amu;
    mT[isys] *= amu;

    // Beam      
    Double_t EB_lb  = EkB_lb + mB[isys];
    Double_t PB_lb     = sqrt(EB_lb*EB_lb - mB[isys]*mB[isys]);
    //PB_lb = sqrt(EkB_lb*EkB_lb + 2.*mB[isys]*EkB_lb);
    Double_t YB_lb  = 0.5 * log( (EB_lb + PB_lb) / (EB_lb - PB_lb) );

    // CM system     
    auto E_cm    = sqrt( mB[isys]*mB[isys] + mT[isys]*mT[isys] + 2.* mT[isys] * EB_lb);
    auto Beta_cm = PB_lb/(EB_lb + mT[isys]);
    auto Gamm_cm = (EB_lb + mT[isys]) / E_cm;

    auto y_cm = 0.5 * log( (1+Beta_cm)/ (1-Beta_cm) );


    auto EB_cm = Gamm_cm * EB_lb - Gamm_cm*Beta_cm * PB_lb;
    auto PB_cm = -Gamm_cm* Beta_cm * EB_lb + Gamm_cm * PB_lb;
    auto YB_cm =  0.5 * log( (EB_cm + PB_cm) / (EB_cm - PB_cm) );

    auto ET_cm = Gamm_cm * mT[isys];
    auto PT_cm = -Gamm_cm * Beta_cm * mT[isys];
    auto YT_cm =  0.5 * log( (ET_cm + PT_cm) / (ET_cm - PT_cm) );


    cout << " --- Reaction  " << system[isys] << endl
	 << " Beam Mass   " << mB[isys]/amu << " [u] "
	 << " Beam Enery  " << eB_lb[isys] << " [MeV/u] "
	 << " Target Mass " << mT[isys]/amu
	 << " --- "
	 << endl;

    cout << " Beam --- " 
	 << " Ekine  " << EkB_lb << " [MeV] "
	 << " Energy " << EB_lb  << " [MeV] "
	 << " P      " << PB_lb  << " [MeV/c] "
	 << " Y      " << YB_lb  
	 << endl;

    cout << " Ecm  --- " << E_cm << " [MeV] "
	 << " Beta_cm " << Beta_cm 
	 << " Gamm_cm " << Gamm_cm 
	 << " Y_cm " << y_cm
	 << endl;


    cout << " E_beam   " << EB_cm
	 << " P_beam   " << PB_cm
	 << " Y_beam   " << YB_cm
	 << endl;
    cout << " E_target " << ET_cm
	 << " P_target " << PT_cm
	 << " Y_target " << YT_cm 
	 << endl;

    cout << " dY " << YB_cm - YT_cm << endl;
  }
}

