module.exports = {
  production: {
    store: {
      type: "S3",
      accessKeyId: process.env['S3_ID'],
      secretAccessKey: process.env['S3_SECRET'],
      bucket: "busdetective-pro",
      acl: 'public-read',
      indexMode: "indirect",
    },

    assets: {
      type: "s3",
      accessKeyId: process.env['S3_ID'],
      secretAccessKey: process.env['S3_SECRET'],
      bucket: 'busdetective-pro'
    }
  }
};
