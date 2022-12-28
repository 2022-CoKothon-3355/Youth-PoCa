let errorHandler = (err, req, res, next) => {
    if(typeof err === "string"){
        return res.status(400).json({message: err})
    }

    if(err.name === "validationError"){
        return res.status(400)
            .json({message: err})
    }

    res.status(500).json({message: err.message})
}

export default errorHandler