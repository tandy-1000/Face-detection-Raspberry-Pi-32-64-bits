#include "MNN_UltraFace.hpp"
#include <iostream>
#include <opencv2/opencv.hpp>

using namespace std;

int main(int argc, char **argv) {
    cv::Mat frame;

    UltraFace ultraface("slim-320-quant-ADMM-50.mnn", 320, 240, 4, 0.65); // config model input

    cv::VideoCapture cap(0);
    if (!cap.isOpened()) {
        cerr << "ERROR: Unable to open the camera" << endl;
        return 0;
    }
    cout << "Start grabbing, press ESC on Live window to terminate" << endl;

    cv::namedWindow("win", cv::WINDOW_NORMAL);
    cv::setWindowProperty("win", cv::WND_PROP_FULLSCREEN, cv::WINDOW_FULLSCREEN);

    while(1){
//        frame=cv::imread("27.jpg");  //if you want to run just one picture need to refresh frame before class detection
        cap >> frame;
        if (frame.empty()) {
            cerr << "ERROR: Unable to grab from the camera" << endl;
            break;
        }

        vector<FaceInfo> face_info;
        ultraface.detect(frame, face_info);

        for (auto face : face_info) {
            cv::Point pt1(face.x1, face.y1);
            cv::Point pt2(face.x2, face.y2);
            cv::rectangle(frame, pt1, pt2, cv::Scalar(0, 255, 0), 2);
        }

        //show output
        cv::imshow("win", frame);
        char esc = cv::waitKey(5);
        if(esc == 27) break;
    }
    cv::destroyAllWindows();
    return 0;
}
