Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.73])
 by mx.groups.io with SMTP id smtpd.web11.21368.1629102018685895830
 for <docs@lists.yoctoproject.org>;
 Mon, 16 Aug 2021 01:20:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherrycloud.onmicrosoft.com header.s=selector2-cherrycloud-onmicrosoft-com header.b=te/f1/Rc;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.8.73, mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZLVOYBrjv7OWExfU2vuWoFXI1lUo8B+qFQnzXuCDiRGFH6gwoFmL5DLBoy+9HMWc9W6/Uxi5rcP75soAu63vEas5G/ottfC8kah/XKDslSyClybSdNOY2LU2SSE3qSw+wgqE8+OQpsVCXl1wm2Z86IOTW7RMs1NUN8weAjECeAl+YUtMqJ7yfjsBaBPNBT7qvZxylKPOxR2Xnbs+Ah3S02jxCr5khyic+5TqKAJR7NHLxq40UK8ihr6qmubiaBfh0Tb83C6ELzO6ZRIPLYgKtpYfNO+1JFY9vheiRUfBAkbgxTTSy1izb8Ous5idAoFGXI2nWRE/pipgM7G9kTV8yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zcfoX/QPcSUWYaVb7Cnn+2SvSktpWcr8btYbIRZLHPI=;
 b=DXYjM6pPSCYXtKONMnQjZ0hZbX6VpxCUDiu8X9pCEjmPAzH+GvIdhgTCyFeHG+ohjhE0BQ26v/KAF0M94hgc8cLxk0VeEPvQ5tCWYT4wNvMIeZvFZnTzxQkEDsAdYIcyRkq9NSqlnWGqq1q3h+xe8cFGDnZ8FIBC9+caHREyBni9HlrUmRiuzC4PlB+Xa7hos+YJjQPYLwGM3hQuQ+m6O/1ZbBOudey5h04EPX5jN2dZMii1ewg6uL5IdGTs5pe6Ec+k1TFrA8B4LFELqJ8Vp4l//AUZyMwkVxOLpHVcF+KDiP/Nfm6RL8bdiAkwYtXp5OjS4Y008oFtrbtTQzqBDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zcfoX/QPcSUWYaVb7Cnn+2SvSktpWcr8btYbIRZLHPI=;
 b=te/f1/Rcti8A3dtlcP4qfLlm2PH0hkSNT+QPDT54vzBxaUBGr6q8yg2fBnW8BvjOgQ4SZOARktlNSD1VBjv2DRcDX50LlbpdHVmOSRT23oMFXlt7o20tOFPU9AINRsZF6deSKDvSWb15JX31E5zUIfwy7kYqUTDpdDrKNF/YA+U=
Authentication-Results: pbarker.dev; dkim=none (message not signed)
 header.d=none;pbarker.dev; dmarc=none action=none
 header.from=theobroma-systems.com;
Received: from AM0PR0402MB3348.eurprd04.prod.outlook.com
 (2603:10a6:208:24::24) by AM8PR04MB7201.eurprd04.prod.outlook.com
 (2603:10a6:20b:1d1::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.15; Mon, 16 Aug
 2021 08:20:15 +0000
Received: from AM0PR0402MB3348.eurprd04.prod.outlook.com
 ([fe80::cd35:af76:7542:4dd6]) by AM0PR0402MB3348.eurprd04.prod.outlook.com
 ([fe80::cd35:af76:7542:4dd6%7]) with mapi id 15.20.4415.023; Mon, 16 Aug 2021
 08:20:15 +0000
Date: Mon, 16 Aug 2021 10:20:13 +0200
From: "Quentin Schulz" <quentin.schulz@theobroma-systems.com>
To: Paul Barker <paul@pbarker.dev>
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] ref-manual: Document BB_GIT_SHALLOW and friends
Message-ID: <20210816082013.2y7fyslew2okjxzg@fedora>
References: <20210813151148.19415-1-paul@pbarker.dev>
In-Reply-To: <20210813151148.19415-1-paul@pbarker.dev>
X-ClientProxiedBy: FR0P281CA0060.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::17) To AM0PR0402MB3348.eurprd04.prod.outlook.com
 (2603:10a6:208:24::24)
Return-Path: quentin.schulz@theobroma-systems.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from fedora (92.42.140.82) by FR0P281CA0060.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:49::17) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.9 via Frontend Transport; Mon, 16 Aug 2021 08:20:15 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4fd99852-bfa5-4e24-16d5-08d9608ead02
X-MS-TrafficTypeDiagnostic: AM8PR04MB7201:
X-Microsoft-Antispam-PRVS: 
	<AM8PR04MB720147B51EB68B763C5A6F86C2FD9@AM8PR04MB7201.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	9NyInIA/IAv7IJ7jWp+uCbrIiXhwRYuZLmi+ITjBFFa6JTYgn5XU6BfoTSk3v0jez8yVt+Ym+oFMv/0xL3A6KdvYk8db5BwtN/BwAmWJz1mQQ487SoZgFGcCcwVqoTQKlOoHOy5o/FwsMw7/5TE4/vlWENoJc1zHbOqmEleLMUIqbCRkbp2mT9uDcZaFYDgo+EYzz5KGocwQ+C91JG4gsuMlW4mETwH5+t+RiSDc1j2Y2iPQB1loK5Nyrgy0GbV35baEtguCo/L1qxLr9lI47thgBZyKBEKge3Pf1PgtsQJo1z8P3PgBlB1CgXnADW1a72Jw0NAua27GfDx+mR+4knseG77koZm8ZDziuaFLRI7encFVHGQEHI8kx6zzrkBz1JUdVB8XAasrHgJybDnn/OoBmAJa3W/QW5RiQ4/YNF9MrSIavaTVZHc4C1y4G0Uh5lY/UNt2qncsBXX0QxN9WVhz6rzSVh56zaDfoOnryKNc0ss6FaVpI58IOZMTnzGqBTyzKPTH0k3T4IM2JbKocH1aaCoC4Oi/rGqEAg0a9cW9d/zXHkSmWxQrCYeQimo7yXuDL/sKGNKF8PT1F5yqMUuI5ESj1f/BSz2sSr5FsVHqO+XrCiITBS4yRnWr2cf27/a5TwcMm6RWrf4nF9313tTXkudGsgFRF5k27dMwMu1J9gcXGzlpd1MBNxWPf4k+
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR0402MB3348.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(376002)(39840400004)(346002)(136003)(366004)(52116002)(956004)(55016002)(83380400001)(6916009)(9576002)(38350700002)(38100700002)(6496006)(44832011)(66946007)(8936002)(478600001)(4326008)(9686003)(26005)(1076003)(2906002)(33716001)(5660300002)(8676002)(186003)(86362001)(66556008)(316002)(66476007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?DYLgwfLzv/LJLGWTA033VAliHF43VM+wWY8mMv9g6+FVF2Pmxdkw1uPNWtiU?=
 =?us-ascii?Q?T7/HoyWi2QmM4B9/mq+5W3VuNO81hPPcqctq7lSuvthdvwbeTIEkp6goGVlP?=
 =?us-ascii?Q?DO5Iq5b+Xp2hzT9LjwIsQGDMyx13rVBHMc50fH7g+xaILhmBVOKU1b8ui0K2?=
 =?us-ascii?Q?oQCg3U6l+zM81JpWtCvfIvI+ZiER+24bdE0W6YHp2ESug79WciOA52Hv9QrS?=
 =?us-ascii?Q?KP2VYbwC4V8li4oockSNJyuTwzphKM1rs/W5JJW9zyPLikqga0vI3F3j7jpV?=
 =?us-ascii?Q?l5nVEfmQIJhI4rzvrcxNKCqPXnMVB261aova8CdfDAsaa7Mr9daALq1nj9Bq?=
 =?us-ascii?Q?Db7GW4YSj2K3ES9HZ9ZK3S2bzRYEw1nLtrpQpzGW69K8W8fo8O1cOpmwRf4o?=
 =?us-ascii?Q?0ePphZLy6uHpFuVV+FqwFBS91eGnHZlr5odQTgiEGj0NN/MrIBqx650xySWk?=
 =?us-ascii?Q?IqzYetWtMO1+OAqDL+mK8SLyDQIrcgruCpITvXXNAAjiX3CUbVUSHIlfDGQ4?=
 =?us-ascii?Q?Hra2o73AnIpyE+jEBzfpzbei8jO+7jEikczXCM8Yr1GVWjxPA42SbYq6F54q?=
 =?us-ascii?Q?L4Q48EuYRNXQpEFoZcQNN1o6rt1ZNuP/MDIzVsPn2ec7uBUSD6UjhVT8yhgM?=
 =?us-ascii?Q?6YSOdWQREYC+rxs4q0lGStqmrL+e1HsXPpUq372Vs5EXa72VdV2XjXxQP14E?=
 =?us-ascii?Q?KtADpSvKGCmHhO8AKoIt777dGGTcqUP/4cxhqQsa8924cAZNoorUY5XS5dOQ?=
 =?us-ascii?Q?FltJNhHmtRt8pV2igVoZYl/aRiYKDOikt1n/UvrvjU6PDzd8OkfWq0piLel1?=
 =?us-ascii?Q?SL81MnYb667QiVJyEHwmJKSyLMhNIXjr2f/0+Wfhzza8cE/v80AD4CRAM0Xm?=
 =?us-ascii?Q?SYCPVe6M6flLiMt8PKiwDU4UG6EfjRocbrcS0vclrasTEjpa2x9IMdRcOomC?=
 =?us-ascii?Q?PO/9/+77IfWLgpeGwX6LAMEqCVXgu8IYueD620DreJ/UroFqItp7atj3OE48?=
 =?us-ascii?Q?XNSVgXXw2RXMdtANphVHIFIxwaDO90wgJFJyXmWCkaR/RacpKL+JaZIpOQQe?=
 =?us-ascii?Q?QMIH6txxuSTMtGw6l6eA2ww/refNFCmQvtOk3/W4e74fTNLUqhQHV6PpnGbb?=
 =?us-ascii?Q?Zin0C6jQGuPfrah9xLKPQSz9SAswe9hanUjazi1F2Wf4ERzuMyAeuNlhH0/T?=
 =?us-ascii?Q?xDCYfCpUxG65FNAFT+q0ALlT6yGVbxC9T/V6gfAm9mA1vQpGLVEY+bZblK15?=
 =?us-ascii?Q?Sf5+qkem9WXZF9sE62nkUlJ04yF8IAKzLSKmJKPcZ9D61Z17mgbaio98pzEb?=
 =?us-ascii?Q?0J5C/A5xN4fw7W3Xoo2QJ1Nj?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fd99852-bfa5-4e24-16d5-08d9608ead02
X-MS-Exchange-CrossTenant-AuthSource: AM0PR0402MB3348.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2021 08:20:15.4943
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8jXj2Q0x8WS+dJYSb7qD2JGT7d84b+WZeqJL8lzuahotKwhG4MlbCmUTGzhwWEDZrm+dkC52TBTcEz/hYH10VNM8HVs/zi7LUiglYqSPfaBOZsvHk2OyKbj8m+xWG20Z
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7201
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Paul,

On Fri, Aug 13, 2021 at 04:11:48PM +0100, Paul Barker wrote:
> Documentation is based on the commit message of bitbake rev 5ed7d85fda
> and mailing list discussion.
> 
> [YOCTO #14493]
> 
> Signed-off-by: Paul Barker <paul@pbarker.dev>
> ---
>  documentation/ref-manual/variables.rst | 55 ++++++++++++++++++++++++++
>  1 file changed, 55 insertions(+)
> 

Since those variables are used in Bitbake source code, I'd say this
addition would make more sense in Bitbake documentation.

> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
> index f6d248a19..edab054f1 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -524,6 +524,61 @@ system and gives an overview of their function and contents.
>        clean up your :term:`DL_DIR` directory by deleting any Git or other
>        source control work directories.
>  
> +   :term:`BB_GENERATE_SHALLOW_TARBALLS`
> +      Setting this variable to "1" when :term:`BB_GIT_SHALLOW` is also set to
> +      "1" causes bitbake to generate shallow mirror tarballs when fetching git
> +      repositories. The number of commits included in the shallow mirror
> +      tarballs is controlled by :term:`BB_GIT_SHALLOW_DEPTH`.
> +
> +      If both :term:`BB_GIT_SHALLOW` and :term:`BB_GENERATE_MIRROR_TARBALLS` are
> +      enabled, bitbake will generate shallow mirror tarballs by default for git
> +      repositories. This separate variable exists so that shallow tarball
> +      generation can be enabled without needing to also enable normal mirror
> +      generation if it is not desired.
> +
> +      For example usage, see :term:`BB_GIT_SHALLOW`.
> +
> +   :term:`BB_GIT_SHALLOW`
> +      Setting this variable to "1" enables the support for fetching, using and
> +      generating mirror tarballs of shallow git repositories. The external
> +      git-make-shallow script is used for shallow mirror tarball creation.
> +
> +      When BB_GIT_SHALLOW is enabled, bitbake will attempt to fetch a shallow

s/BB_GIT_SHALLOW/:term:`BB_GIT_SHALLOW`/

> +      mirror tarball. If the shallow mirror tarball cannot be fetched, it will
> +      try to fetch the full mirror tarball and use that.
> +
> +      When a mirror tarball is not available, a full git clone will be performed
> +      regardless of whether this variable is set or not. Support for shallow
> +      clones is not currently implemented as git does not directly support
> +      shallow cloning a particular git commit hash (it only supports cloning
> +      from a tag or branch reference).
> +
> +      See also :term:`BB_GIT_SHALLOW_DEPTH` and
> +      :term:`BB_GENERATE_SHALLOW_TARBALLS`.
> +
> +      Example usage::
> +
> +         BB_GIT_SHALLOW ?= "1"
> +
> +         # Keep only the top commit
> +         BB_GIT_SHALLOW_DEPTH ?= "1"
> +
> +         # This defaults to enabled if both BB_GIT_SHALLOW and
> +         # BB_GENERATE_MIRROR_TARBALLS are enabled
> +         BB_GENERATE_SHALLOW_TARBALLS ?= "1"
> +
> +   :term:`BB_GIT_SHALLOW_DEPTH`
> +      When used with :term:`BB_GENERATE_SHALLOW_TARBALLS`, this variable sets
> +      the number of commits to include in generated shallow mirror tarballs.
> +      With a depth of 1, only the commit referenced in :term:`SRCREV` is
> +      included in the shallow mirror tarball. Increasing the depth includes
> +      additional parent commits, working back through the commit history.
> +
> +      If this variable is unset, bitbake will default to a depth of 1 when
> +      generating shallow mirror tarballs.
> +
> +      For example usage, see :term:`BB_GIT_SHALLOW`.
> +

I'd have liked a link to a small article/tutorial/man page explaining
what shallow cloning is and what are its advantages and downsides since I have
never used this before. But in any case, I guess people looking for this
variable will know what it's for or could Google this.

Except for the location of this doc (for me should be in bitbake docs):
Reviewed-by: Quentin Schulz <foss@0leil.net>

Thanks!
Quentin
