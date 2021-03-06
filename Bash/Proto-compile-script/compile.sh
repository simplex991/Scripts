#!/bin/bash

#To run the script, type bash compile.sh in console

# Change file path to the file path to protoc.exe
# Example: C:/protoc/bin/protoc
# You need to be in the research file (models/reserch)
path="PROTO_FILE_PATH";

echo "$path object_detection/protos/anchor_generator.proto --python_out=.";
echo "$path object_detection/protos/argmax_matcher.proto --python_out=.";
echo "$path object_detection/protos/bipartite_matcher.proto --python_out=.";
echo "$path object_detection/protos/box_coder.proto --python_out=.";
echo "$path object_detection/protos/box_predictor.proto --python_out=.";
echo "$path object_detection/protos/calibration.proto --python_out=.";
echo "$path object_detection/protos/eval.proto --python_out=.";
echo "$path object_detection/protos/faster_rcnn.proto --python_out=.";
echo "$path object_detection/protos/faster_rcnn_box_coder.proto --python_out=.";
echo "$path object_detection/protos/graph_rewriter.proto --python_out=.";
echo "$path object_detection/protos/grid_anchor_generator.proto --python_out=.";
echo "$path object_detection/protos/hyperparams.proto --python_out=.";
echo "$path object_detection/protos/image_resizer.proto --python_out=.";
echo "$path object_detection/protos/input_reader.proto --python_out=.";
echo "$path object_detection/protos/keypoint_box_coder.proto --python_out=.";
echo "$path object_detection/protos/losses.proto --python_out=.";
echo "$path object_detection/protos/matcher.proto --python_out=.";
echo "$path object_detection/protos/mean_stddev_box_coder.proto --python_out=.";
echo "$path object_detection/protos/model.proto --python_out=.";
echo "$path object_detection/protos/multiscale_anchor_generator.proto --python_out=.";
echo "$path object_detection/protos/optimizer.proto --python_out=.";
echo "$path object_detection/protos/pipeline.proto --python_out=.";
echo "$path object_detection/protos/post_processing.proto --python_out=.";
echo "$path object_detection/protos/preprocessor.proto --python_out=.";
echo "$path object_detection/protos/region_similarity_calculator.proto --python_out=.";
echo "$path object_detection/protos/square_box_coder.proto --python_out=.";
echo "$path object_detection/protos/ssd.proto --python_out=.";
echo "$path object_detection/protos/ssd_anchor_generator.proto --python_out=.";
echo "$path object_detection/protos/string_int_label_map.proto --python_out=.";
echo "$path object_detection/protos/train.proto --python_out=.";






