import multer from "multer"
import path from "path"

const FILE_SIZE = 1048576

const storage = multer.diskStorage({
    destination: (req, file, cb) => {
        cb(null, './uploads')
    },

    filename: (req, file, cb) => {
        cb(null, Date.now() + "-", file.originalname)
    },
});

const fileFilter = (req, file, callback) => {
    const validExts = [".png", ".jpg", ".jpeg"]

    if(!validExts.includes(path.extname(file.originalname))){
        return callback(new Error("Only .png, .jpg & .jpeg format allowed"))
    }

    const fileSize = parseInt(req.header["content-length"])
    if(fileSize > FILE_SIZE) {
        return callback(new Error("File size is Big"))
    }

    callback(null, true)
}

let upload = multer({
    storage: storage,
    fileFilter: fileFilter,
    fileSize: FILE_SIZE,
})

export default upload.single("productImage")