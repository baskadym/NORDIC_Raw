
working_dir = '/hostshare/barbara/20240125.M700846_FIL/fQSM_netplus_qualitymask';
cd(working_dir)


%% magnitude and phase output 
fn_magn_in = 'mag.nii';
fn_phase_in = 'ph.nii';
fn_out = 'nordic_cmplx_imspace_';
ARG.temporal_phase=1;
ARG.phase_filter_width=10;
ARG.make_complex_nii = 'yes';
ARG.use_generic_NII_read = 0;
% 
NIFTI_NORDIC(fn_magn_in,fn_phase_in,fn_out,ARG)

% %% in k-space with mag and phase data:
% 
% fn_out = 'nordic_cmplx_kspace_kernel4_g14_perm_';
% ARG.temporal_phase=1;
% ARG.phase_filter_width=10;
% ARG.make_complex_nii = 'yes';
% ARG.kernel_size_PCA = [4 4 4];
% % ARG.kernel_size_gfactor = [8 8 1];
% 
% % fn_magn_in = 'mag.nii';
% % fn_phase_in = 'ph.nii';
% % mag = nifti(fn_magn_in).dat(:,:,:,:) ;
% % ph = nifti(fn_phase_in).dat(:,:,:,:) ;
% % im_cmplx = permute(mag.*exp(1i*ph),[3 2 1 4]) ;
% % kspace_cmplx = gadgetron.lib.fft.cfftn(im_cmplx, 1:3) ;
% % createNifti(abs(kspace_cmplx),'mag_kspace.nii', nifti(fn_magn_in).mat)
% % createNifti(angle(kspace_cmplx),'ph_kspace.nii', nifti(fn_phase_in).mat)
% % fn_magn_in = 'mag_kspace.nii';
% % fn_phase_in = 'ph_kspace.nii';
% % % 
% % NIFTI_NORDIC(fn_magn_in,fn_phase_in,fn_out,ARG)
% 
% kspace_mag = nifti(sprintf('%smagn.nii',fn_out)).dat(:,:,:,:) ;
% kspace_ph = nifti(sprintf('%sphase.nii',fn_out)).dat(:,:,:,:) ;
% kspace_cmplx = kspace_mag.*exp(1i*kspace_ph);
% im_cmplx = ipermute(gadgetron.lib.fft.cifftn(kspace_cmplx, 1:3), [3 2 1 4]) ;
% 
% createNifti(abs(im_cmplx),sprintf('%smag_im.nii',fn_out), nifti(fn_magn_in).mat)
% createNifti(angle(im_cmplx),sprintf('%sph_im.nii',fn_out), nifti(fn_phase_in).mat)

% %% magnitude only output
% fn_magn_in = 'mag.nii';
% fn_phase_in = 'ph.nii';
% fn_out = 'mag_nordic';
% ARG.temporal_phase=1;
% ARG.phase_filter_width=10;
% 
% NIFTI_NORDIC(fn_magn_in,fn_phase_in,fn_out,ARG)