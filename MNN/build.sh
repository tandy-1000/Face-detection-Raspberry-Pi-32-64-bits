pushd ~/Face-detection-Raspberry-Pi-32-64-bits/MNN

g++ -Wall -fexceptions -pthread -O3 -I/usr/local/include/opencv4 -I/usr/local/include/MNN -c ~/Face-detection-Raspberry-Pi-32-64-bits/MNN/main.cpp -o obj/Release/main.o

g++ -Wall -fexceptions -pthread -O3 -I/usr/local/include/opencv4 -I/usr/local/include/MNN -c ~/Face-detection-Raspberry-Pi-32-64-bits/MNN/MNN_UltraFace.cpp -o obj/Release/MNN_UltraFace.o

g++ -L/usr/local/lib/ -o bin/Release/FaceDetection obj/Release/main.o obj/Release/MNN_UltraFace.o  -I/usr/local/include/opencv4 -lopencv_gapi -lopencv_stitching -lopencv_aruco -lopencv_barcode -lopencv_bgsegm -lopencv_bioinspired -lopencv_ccalib -lopencv_dnn_objdetect -lopencv_dnn_superres -lopencv_dpm -lopencv_face -lopencv_freetype -lopencv_fuzzy -lopencv_hdf -lopencv_hfs -lopencv_img_hash -lopencv_intensity_transform -lopencv_line_descriptor -lopencv_mcc -lopencv_quality -lopencv_rapid -lopencv_reg -lopencv_rgbd -lopencv_saliency -lopencv_shape -lopencv_stereo -lopencv_structured_light -lopencv_phase_unwrapping -lopencv_superres -lopencv_optflow -lopencv_surface_matching -lopencv_tracking -lopencv_highgui -lopencv_datasets -lopencv_text -lopencv_plot -lopencv_ml -lopencv_videostab -lopencv_videoio -lopencv_wechat_qrcode -lopencv_ximgproc -lopencv_video -lopencv_xobjdetect -lopencv_objdetect -lopencv_calib3d -lopencv_imgcodecs -lopencv_features2d -lopencv_dnn -lopencv_flann -lopencv_xphoto -lopencv_photo -lopencv_imgproc -lopencv_core  -pthread -s  /usr/local/lib/libMNN.so

# ./bin/Release/FaceDetection

popd
