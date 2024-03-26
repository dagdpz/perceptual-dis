% perdis_inactivavation_sites

% penetration database
% xyz: grid_hole_x, grid_hole_y, z depth mm from the top of the grid

n = 1;

switch experiment_id
    
    case 'M1' % Cornelius
        grid_id = 'GRID.22.3';
        
        vmr_path = 'Y:/MRI/Cornelius/20170321/dicom/0101/CO_20170321_chamber_L_normal_neurological_0.25mm.vmr';
        % vmr_path = 'Y:/MRI/Cornelius/20170321/dicom/0101/CO_20170321_chamber_L_normal_neurological.vmr'; % for VOI in ACPC
        % vmr_path = 'Y:/MRI/Cornelius/20170512/dicom/0101/CO_20170512-TO-CO_20170321_chamber_L_normal_neurological_0.25mm.vmr'; % with injection
        
        monkey_prefix = 'CO_';
        
        z_offset_mm = 23; % mm, from top of the grid to the image origin ("brain entry")
        
        penetration_date{n} = '20190124'; xyz(n,:) = [9 -4 -40]; target{n} = 'dPul_l'; notes{n} = ''; n = n+1;
        penetration_date{n} = '20190129'; xyz(n,:) = [9 -4 -40]; target{n} = 'dPul_l'; notes{n} = ''; n = n+1;
        penetration_date{n} = '20190201'; xyz(n,:) = [9 -4 -40]; target{n} = 'dPul_l'; notes{n} = ''; n = n+1;
        penetration_date{n} = '20190207'; xyz(n,:) = [9 -4 -40]; target{n} = 'dPul_l'; notes{n} = ''; n = n+1;
        penetration_date{n} = '20190214'; xyz(n,:) = [9 -4 -41]; target{n} = 'dPul_l'; notes{n} = ''; n = n+1;
        penetration_date{n} = '20190228'; xyz(n,:) = [9 -4 -41]; target{n} = 'dPul_l'; notes{n} = ''; n = n+1;
        penetration_date{n} = '20190314'; xyz(n,:) = [9 -4 -41]; target{n} = 'dPul_l'; notes{n} = ''; n = n+1;
        
        
    case 'M2' % Curius
        grid_id = 'GRID.22.3';
        
        vmr_path = 'Y:/MRI/Curius/20190628_anatomy/dicom/0100/CU_20190628_R_chamber_normal_neurological_0.25mm.vmr';
        % vmr_path = 'Y:/MRI/Curius/20190628_anatomy/dicom/0100/CU_20190628_R_chamber_normal_neurological.vmr'; % for VOI in ACPC
        % vmr_path = 'Y:/MRI/Curius/20200514_anatomy/dicom/0103/CU_20200514-TO-CU_20190628_R_chamber_normal_neurological_0.25mm.vmr'; % with injection
        monkey_prefix = 'CU_';
        
        z_offset_mm = 19.5; % mm, from top of the grid to the image origin ("brain entry")
        
        penetration_date{n} = '20190729'; xyz(n,:) = [2 3 -38]; target{n} = 'dPul_r'; notes{n} = ''; n = n+1;
        penetration_date{n} = '20190801'; xyz(n,:) = [2 3 -38]; target{n} = 'dPul_r'; notes{n} = ''; n = n+1;
        penetration_date{n} = '20190809'; xyz(n,:) = [2 3 -38]; target{n} = 'dPul_r'; notes{n} = ''; n = n+1;
        penetration_date{n} = '20190814'; xyz(n,:) = [2 3 -38]; target{n} = 'dPul_r'; notes{n} = ''; n = n+1;
        penetration_date{n} = '20190820'; xyz(n,:) = [2 3 -38]; target{n} = 'dPul_r'; notes{n} = ''; n = n+1;
        penetration_date{n} = '20190905'; xyz(n,:) = [2 3 -38]; target{n} = 'dPul_r'; notes{n} = ''; n = n+1;
        penetration_date{n} = '20190913'; xyz(n,:) = [2 3 -38]; target{n} = 'dPul_r'; notes{n} = ''; n = n+1;
        
end
