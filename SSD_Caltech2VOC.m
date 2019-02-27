% dbInfo('usatrain');  
% dbExtract('G:/dataset/pedsi/Caltech/Caltechx10/train', 1, 3);
% dbInfo('usatrainval'); 
% dbExtract('G:/dataset/pedsi/Caltech/Caltechx10/val', 1, 111);
% dbInfo('usatest');   
% dbExtract('G:/dataset/pedsi/Caltech/Caltechx10/test', 1);


anno_path = 'G:\dataset\pedsi\Caltech\Caltechx10\train\annotations\';
files=bbGt('getFiles',{anno_path});


min_gt_height = 30;
pLoad={'lbls',{'person'},'ilbls',{'people', 'ignore'},'squarify',{3,.41}};
pLoad = [pLoad 'hRng',[min_gt_height inf], 'vRng',[1 1] ];

tar_anno_path = 'G:\dataset\pedsi\Caltech\Caltechx10\train\labels\';

for i = 1:length(files)
      [pathstr, name, ext] = fileparts(files{i});  
    
      outname = [tar_anno_path name ext];
      
      fid=fopen(outname,'w'); assert(fid>0);
    
      [objs,gts]=bbGt('bbLoad', files{i}, pLoad);
 
      for k=1:length(objs)
          o=objs(k);
          if o.ign==0
              lbl = 1;
          else
              continue;
          end
          
          bb=o.bb;
          
          xmin = bb(1);
          ymin = bb(2);
          xmax = bb(1)+bb(3);
          ymax = bb(2)+bb(4);
          
          if  xmin<1 || xmax>640 || ymin<1 || ymax>480
              continue;
          end
          
          fprintf(fid,['%i' repmat(' %i',1,4) '\n'],lbl,[xmin ymin xmax ymax]);
      end
        
      fclose(fid);   
end
