Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.86])
 by mx.groups.io with SMTP id smtpd.web08.21787.1629105272150878199
 for <docs@lists.yoctoproject.org>;
 Mon, 16 Aug 2021 02:14:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherrycloud.onmicrosoft.com header.s=selector2-cherrycloud-onmicrosoft-com header.b=Kcg11uZm;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.20.86, mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ELI0b79ihKlc/6FcHitl9DBGuRuI3js06pE9xZ6vfUXEd7GrgxGXnk1WmcKWxg90xZJTWAh6IRH0hS2N6dIO1DAM1AasBYtqtxQQxmb63++BeLhGQvG/yits5YZ2NFX+9ZTfRgvfGx7GUdG3hSsc5gsMcJQudm1k/lIjlOKE7bjxKkpdO/rBI7YKCq78/nn2L1sORLuLVi3Z9Hm81KxkW/oGGc0ed5QlxzMuzikPWPXb7lihyrr10S8TV2yyH5L1QQqaeaWalBaDVjC/Xq+5yrc1w0scnKF8PGd85NsXD+FU6m994+XcEgdN7yurntegE4dNyTlDgcaBZrfI3ZPXhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rGVlWMvatCwDHqTTq4lRCYvpAbRkHv0HPMH5GAQpu6M=;
 b=V9UYxk6IK7Vz0vgBxN3FbfY8mIv1vJ6oyQSoYCiVMWRdLL/Vp9iWY5xr5hzfxM4bllOaZIAEOgOPzZgW1+9saDO4aA1X7A1tTD1lsaSzoP5AT2PCE/HTK9zpW1m9ZSxvYF2aizzvgyHyl5lK+C04y/FD3903MjKnIc/SOKue3yOSGOleyibH1RFkvqvCx8nUgl0ff5EyIzBrro3e/NSoqbapyLZej6VTKECaUBQGEQTrvrFD089cju+zeVV7DMKHwno4g1lJJ5SQyJmPNV06afeeS5JAbmAKuIfAgy4vRYJuxS66ExKkcpEk5Pd4IVeTYmyI5jIZoadPHu+RE2yE1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rGVlWMvatCwDHqTTq4lRCYvpAbRkHv0HPMH5GAQpu6M=;
 b=Kcg11uZmzARjI6H03RhxoPCEQPRJJnOfaa24CLeFwV+rJlUpR4qh5pjmtTS17piBNp6YiCmBByIOVJAk4n3gCCzmV6WUIeWRvvMCBVBHVhjdV8pZ2SMP8XYoyGGhf8s+sKZX6Qr9hy03nBCoYKjSZXg6v6d0y3+GN3rhXWuMcCE=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none
 header.from=theobroma-systems.com;
Received: from AM0PR0402MB3348.eurprd04.prod.outlook.com
 (2603:10a6:208:24::24) by AM0PR04MB6689.eurprd04.prod.outlook.com
 (2603:10a6:208:172::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.17; Mon, 16 Aug
 2021 09:14:29 +0000
Received: from AM0PR0402MB3348.eurprd04.prod.outlook.com
 ([fe80::cd35:af76:7542:4dd6]) by AM0PR0402MB3348.eurprd04.prod.outlook.com
 ([fe80::cd35:af76:7542:4dd6%7]) with mapi id 15.20.4415.023; Mon, 16 Aug 2021
 09:14:29 +0000
Date: Mon, 16 Aug 2021 11:14:27 +0200
From: "Quentin Schulz" <quentin.schulz@theobroma-systems.com>
To: Vyacheslav Yurkov <uvv.mail@gmail.com>
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] ref-manual: add overlayfs class
Message-ID: <20210816091427.25cqk6kx3mnoyua5@fedora>
References: <20210814042825.124630-1-uvv.mail@gmail.com>
In-Reply-To: <20210814042825.124630-1-uvv.mail@gmail.com>
X-ClientProxiedBy: PR0P264CA0146.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1b::14) To AM0PR0402MB3348.eurprd04.prod.outlook.com
 (2603:10a6:208:24::24)
Return-Path: quentin.schulz@theobroma-systems.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from fedora (92.42.140.82) by PR0P264CA0146.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1b::14) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.14 via Frontend Transport; Mon, 16 Aug 2021 09:14:28 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: caa21f99-3e28-4c5f-d445-08d96096404e
X-MS-TrafficTypeDiagnostic: AM0PR04MB6689:
X-Microsoft-Antispam-PRVS: 
	<AM0PR04MB66899888047E136872A94068C2FD9@AM0PR04MB6689.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3276;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	/8c2oFRpSVkPUzlW6zG/3EVL54W6dJ1VJCFUdRmnCO9aHCV8c2fIUU6zmk4s7WktEsvgT+UZhVlYSIRbeSIJcsv/ve50+E53Nsp0QzqpbxQMJDHT2o5+gUkd3j6mkt79Lkq7vU05aJhfEeCySArXKAKC6KIKwYWaWWXWZpeqyiJH6qF+q6t17RSodZmRmWzWRo4EbB9sRQXb7y0PfMpxO9DSX+QU7d0TlTDg75ZKSH+YkSI3e79z2AoIQT/1X265YB0iN4o1AF468mwxEM6x7CAg8O8AY79lse3alIgXfsfTyYgZDDVvnZdzweFOk17RN8YUYx/m1l/KJT2vtPxeLcEAz5VI7DoTtMwgjiNvhFJV6F8Qqv8mf9GK3AISEfL9tPGu7znbF+jC30NjRAd2ORIM/0QEUbniBP1X425TL9i9xEDmIrZRRU3Hu3pq9qnPfBDpVYiSoX/t5nx2JFWrBH3OiRKiJbAXJAIwjzAieF/EcLrSNcgetEHJUDtNi3xvHzP4KNT39MgZ6n24Qca7AeGK3GfVsICFCM4s/mJ78110lWErqoQGC722OqSUf4L0zA+sM6dVZ638ZY9R9L0MQudgUhTLyVqQH0W6O2p4445JJyIbAqfjOCL9oIvcRAgRclgwOizEHJ4Z5NFPfCWlw797Oa0EMfR//bIDE0c5hmPAfk0UZ1MiXO4YiuWvgRApNB4iD9p+mh8Y+RmY2oE8+w==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR0402MB3348.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(136003)(39840400004)(366004)(346002)(376002)(5660300002)(6496006)(52116002)(26005)(478600001)(186003)(55016002)(44832011)(956004)(9686003)(66946007)(66556008)(66476007)(6916009)(316002)(1076003)(9576002)(86362001)(4326008)(33716001)(83380400001)(2906002)(8676002)(8936002)(38350700002)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?lRt9Z06q08yQJ1qLjfI+J/jZfSHdRUCcoZf0tL0tzpy/AeG2BB68RlAiaMCv?=
 =?us-ascii?Q?MZeEPsLBxV8OAAR0LvXTvtS+eR0D0dRdJtwQ3hdsInLKzyVCSdEVnx1YutLF?=
 =?us-ascii?Q?UBHvw9QmQOW8654K8gsmolItTSR5HcvD6PfjkQ2kHAskA72mHerTH0DtSJ6B?=
 =?us-ascii?Q?HiMd191QTnWBPXb4J33cYmrPnL7d8+WdYlrs2Sw6Aa7yJY8/GN2lo2sFdw3W?=
 =?us-ascii?Q?oLyRc/aEi3f17ZvBUHR6Ig9qiCcg46YudeMywWKLXf2lyskfjrZVijLMy5J6?=
 =?us-ascii?Q?wdg0XRAfCXTPXUXUd8nDYO057wkEY851IgCwg91rFatOiVytvMODtJSONLOJ?=
 =?us-ascii?Q?5BMWo6gBGaud6qDEabsuCn8ZM2qgZZpvngY9w44aLv1ueur/LXDJ80Yqng5x?=
 =?us-ascii?Q?+vahclFGbDytAFra0RGGPNicXfBDSdLjlPpLTC1gUW7SUAVdso5g6Lsw6Njr?=
 =?us-ascii?Q?zyftvTHH1pbZJFgY4gFXzOpQwmNr9OFYgkWFGSj/2bJ1MoyX6OrWvePYJKXS?=
 =?us-ascii?Q?MJ+plRy4crhM517AecVCWgPpmj01AC68RFrAWF+2DvkdRHMDrpC2wFW6rAY3?=
 =?us-ascii?Q?tPwOaX2g0jfg0pL9AO5YxZO6+UV3gjojCtW3DiBMxtXHh/xYbOJxoHqgRwgD?=
 =?us-ascii?Q?tJfmJXaki8/NE9IzyHdNg56nLv6I1I4lNeRMWdwmOfz9wZoLorLuFiWWRdKz?=
 =?us-ascii?Q?P6NQ8tuDfnzvSoBCH5mG4UcMNkChO5l5lrJS7x14Weu+P2XvMZoLhJ5B3PaV?=
 =?us-ascii?Q?dGC5qjFScxywOZkhM6mxmcIBkXOXElTrwztI3L+GHldGXGWgFvu3ltsJzZYj?=
 =?us-ascii?Q?zlsrGxVbOpiTCU48v7zDwtB9Ype1sxd0uJvzwYiU1KmluyqDbiryF3BCNHPI?=
 =?us-ascii?Q?Y5i77JaKl9DW9MQ3qdq8PO57jvWVw4WRKvjNFW+xxVJBU3z56DwhSLDTH8LR?=
 =?us-ascii?Q?cOAleO40orKBrCjxim7Pbj1ecD2oAHU62BQlKaJNtVJ5KNdrspNgqcifZB36?=
 =?us-ascii?Q?5Z38RDiVQYUR4V042wPRlx5m0UGh4mS869s2NhbI5H+GbsRbNOaNCyDcqxj/?=
 =?us-ascii?Q?2+rFySdF6C9DqFDHOdqaB7lLQbwydZStXe1Iw9Q/ON6dCHWZzoIWjHqfVN/Q?=
 =?us-ascii?Q?Z5IcDVFW3OJDZoBZaT0ElMGCCnXR1ErHEOXjT7KOZ9sU1pvJe2BnHCG54Fmr?=
 =?us-ascii?Q?2QInV4X+8siQigjPoffbxVa7y89MIFweBkgCK9IFjeP3qznFIlyFXBm8AhP4?=
 =?us-ascii?Q?LaIBfId61kfDn+1ZBRBBEguMftDMQ/onWlrxcNrQvtaczBRWf8cXCBlP83h0?=
 =?us-ascii?Q?tDKMBeXe6jjAfiYM9QgWN0jo?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: caa21f99-3e28-4c5f-d445-08d96096404e
X-MS-Exchange-CrossTenant-AuthSource: AM0PR0402MB3348.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2021 09:14:29.0884
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YaSSrQ+wg3JGfSNM6u9qu+TmY4f3Z4gH02cDDmaIPhTy/PNgznckvlKzgMgDkVgwi+n14RNNKMOsEZIh1jlkuCeMRoW1m1MIRe+c7NgALyG0VxRuNmHKkqHZWvAnJM9f
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6689
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Vyacheslav,

Thanks for the patch!

On Sat, Aug 14, 2021 at 06:28:25AM +0200, Vyacheslav Yurkov wrote:
> Signed-off-by: Vyacheslav Yurkov <uvv.mail@gmail.com>
> ---
>  documentation/ref-manual/classes.rst | 46 ++++++++++++++++++++++++++++
>  1 file changed, 46 insertions(+)
> 
> diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
> index a98a64c43..5d33e81a1 100644
> --- a/documentation/ref-manual/classes.rst
> +++ b/documentation/ref-manual/classes.rst
> @@ -1710,6 +1710,52 @@ one such example. However, being aware of this class can reduce the
>  proliferation of different versions of similar classes across multiple
>  layers.
>  
> +.. _ref-classes-overlayfs:
> +
> +``overlayfs.bbclass``
> +=======================
> +
> +

One newline is enough :)

> +It's often desired in Embedded System design to have a read-only rootfs.
> +But a lot of different applications might want to have a read-write access to
> +some parts of a filesystem. It can be especially useful when your update mechanism
> +overwrites the whole rootfs, but you want your application data to be preserved
> +between updates. The ``overlayfs`` class provides a way to achieve that by means

s/``overlayfs``/:ref:`overlayfs <ref-classes-overlayfs>`/

> +of overlayfs and at the same time keeping the base rootfs read-only.
> +

I would highlight overlayfs with tick quotes (``overlayfs``).

> +To use this class, set a mount point for a partition overlayfs is going to use as upper
> +layer in your machine configuration. Underlying file system can be anything that
> +is supported by overlayfs. This has to be done in your machine configuration::
> +

How do I know what's supported by overlayfs? Where can I find this
important piece of information?

> +  OVERLAYFS_MOUNT_POINT[data] = "/data"
> +
> +.. note::
> +
> +  QA check fails to catch file existence if you redefine this variable in your recipe!
> +

What about:
This variable must only be set from a configuration file as QA check will fail
to catch file existence if this variable is also set in a recipe.

Also, I'm not sure to understand what "catch file existence" means?
Could you explain to me please :)

> +The class assumes you have a data.mount systemd unit defined elsewhere in your BSP

s/data.mount/``data.mount``/

> +(e.g. in systemd-machine-units recipe) and it's installed to the image.
> +

s/systemd-machine-units/``systemd-machine-units``/

> +Then you can specify writable directories on a recipe basis::
> +

If package recipes are supported, does it actually make sense to have
such variable in there instead of in image recipes?

Just trying to know if we should highlight whether it's a bad idea for
users to do so.

> +  OVERLAYFS_WRITABLE_PATHS[data] = "/usr/share/my-custom-application"
> +
> +To support several mount points you can use a different variable flag. Assume we

s/Assume/Assuming/ ?

> +want to have a writable location on the file system, but not interested where the data
> +survive a reboot. Then we could have a mnt-overlay.mount unit for a tmpfs file system.
> +

s/mnt-overlay.mount/``mnt-overlay.mount``/

s/tmpfs/``tmpfs``/ ?

> +In your machine configuration::
> +
> +  OVERLAYFS_MOUNT_POINT[mnt-overlay] = "/mnt/overlay"
> +
> +and then in your recipe::
> +
> +  OVERLAYFS_WRITABLE_PATHS[mnt-overlay] = "/usr/share/another-application"
> +
> +.. note::
> +
> +   The class does not support /etc directory itself, because systemd depends on it
> +

s/\/etc/``\/etc``/

s/systemd/``systemd``/

My nitpicks excluded, looks good :) ~

Cheers,
Quentin
