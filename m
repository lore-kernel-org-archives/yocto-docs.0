Received: from EUR02-AM5-obe.outbound.protection.outlook.com (EUR02-AM5-obe.outbound.protection.outlook.com [40.107.0.65])
 by mx.groups.io with SMTP id smtpd.web11.22294.1627641188881815032
 for <docs@lists.yoctoproject.org>;
 Fri, 30 Jul 2021 03:33:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherrycloud.onmicrosoft.com header.s=selector2-cherrycloud-onmicrosoft-com header.b=C9Cfdv2t;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.0.65, mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ia7emtq5072y8vTRCES1sfRZzmw1YVL5UEqYkQuy/K7W+W7z8YrNY34sL6xDKk84Z2BZLZU9g80CUJ5sdSCgm0WxiMZc+tMbV/C2lQ6z1MTdnt5XVJets46FN5DwIhq+UkUgd0D90qlW3FYZ7cRD3Z9+xiK2jOSahxx0KI/yHGda7EXb16q6mZrI7M0Dt7SCHKN5AEH9XlNGHaEbHy/J8A5wiOaoU4AiA9J9Iii+2ckJSECIy+wC3vkMj9YfkxmLFBizOupbObnVUw2v8e2VtIGVnqWMhN7e9hsoC9Kdh7igOD66bHdv6nOqx3rcoFCao32XxeKmM5RXDyjzu/GQ0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=odOowoz0fH2Ikvrp/4MtGTTs96p9F22xxkBhauVDF/g=;
 b=CS6V/z2pL3l51tN1hBc9w1xPlRo3Nsh6X7FoyURTL/lfJRpx+TQxGwivmPXLQQ1VO8iyFb4JqFOi2k7dTskvHiQzlLfNqXgGr0NSJmWh09g20e5DMerRY1ia1rEufDwulnGwU4Wd4XyszGhtp8JxB+f6EdusdNQ8RuY30+ekjSkJAQovuGIxpxux5ob+36jUy5XOrlDr5fZzU5jN2UVbWCvyIjRT5u1rpLql81A+YfWnwB4/xP7rzylPFpnKMGSWBBz8Gg6xWB17RW+1DhluslXuI84n+t1UBj9uo0AoxpoJ+AxFRqptv+UV8SLTfWqPHZAQ2NZ3xccFXPI7Cn3AfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=odOowoz0fH2Ikvrp/4MtGTTs96p9F22xxkBhauVDF/g=;
 b=C9Cfdv2tOhKJda4NaNkHU15Uk77n9+xhfNBN/UtDpb5oeq38UtEKf4m8EX3fX/47icyVgNv5pTjH1ySsPhmNRJdQXjDrA88WXC/ap/Z1MGlRGG3F+ECkWrccFYPa6gz9x9Zv3883+zSKcfVl1YNvTHtpb/GLtbULW7nTdTEIXIA=
Authentication-Results: bootlin.com; dkim=none (message not signed)
 header.d=none;bootlin.com; dmarc=none action=none
 header.from=theobroma-systems.com;
Received: from AM0PR0402MB3348.eurprd04.prod.outlook.com
 (2603:10a6:208:24::24) by AM9PR04MB8097.eurprd04.prod.outlook.com
 (2603:10a6:20b:3e9::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.21; Fri, 30 Jul
 2021 10:33:06 +0000
Received: from AM0PR0402MB3348.eurprd04.prod.outlook.com
 ([fe80::459d:3240:1c4e:b920]) by AM0PR0402MB3348.eurprd04.prod.outlook.com
 ([fe80::459d:3240:1c4e:b920%6]) with mapi id 15.20.4373.021; Fri, 30 Jul 2021
 10:33:06 +0000
Date: Fri, 30 Jul 2021 12:33:04 +0200
From: "Quentin Schulz" <quentin.schulz@theobroma-systems.com>
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
Cc: docs@lists.yoctoproject.org,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Quentin Schulz <foss@0leil.net>
Subject: Re: [docs] [PATCH v2] migration-guides: Add start of 3.4 guide with override migration notes
Message-ID: <20210730103304.fb5d2b4aqfwszt4z@fedora>
References: <16968778436D0C00.13113@lists.yoctoproject.org>
 <20210730094757.177431-1-michael.opdenacker@bootlin.com>
In-Reply-To: <20210730094757.177431-1-michael.opdenacker@bootlin.com>
X-ClientProxiedBy: PR0P264CA0261.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100::33)
 To AM0PR0402MB3348.eurprd04.prod.outlook.com (2603:10a6:208:24::24)
Return-Path: quentin.schulz@theobroma-systems.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from fedora (92.42.140.82) by PR0P264CA0261.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100::33) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.18 via Frontend Transport; Fri, 30 Jul 2021 10:33:05 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 23ecc055-3b42-4b76-f160-08d953456ac8
X-MS-TrafficTypeDiagnostic: AM9PR04MB8097:
X-Microsoft-Antispam-PRVS: 
	<AM9PR04MB80972889C362CDCDF61EEBEBC2EC9@AM9PR04MB8097.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	LqcnQXWmVRi9kmH8EIoDx3RQ7ZAUNfvJZNzYf6+Bn3zxWu1Xf82LEuTCDd25aYpaImdthAoSOs1wxaz4EVw12TeS6kWZXDnA3qbGfN9pNeFwuiFP7mGLEppFSp553WOjY5S7CIbiIySlD1oTb2bvTEV9RnaSb7nAwTckytczKR0ZOie0KR5j42J0U5r2F96j6vL0vqOCJz6IjMB/xsZT5dsiIvarxgpkGA9byTKIeAdlfcDgkDinP7/ZV+uy5zfpUlLXOhIh8YL1Ll354lkuSEcAUi7jsnxyIH8J/iGgbuUtxRytLDM2HlOFHHqtNziFfZgeKVpUBH0S068w/j2pjGKUnP/EcdZbj1Bv9mh6hvL9889/oLvMvDHYpFgQUbunjNPwrLwKNKTJeDHqpvychROtlY0Cm9SWvRSCdS6C4I8KYzFdB8VF/KFEclyEXjTj6Vu/04Xi7Ndq0a4qWKYI7Ma4H3dHwmui8+o0rixKZzL8fe8pS46ZnGH8C6JoPJ5HzFIBQW3sNfw2fEG9pAGKSQvrKl60i4kXyGuRoPkn1HyawILFlqtCh9VT2V0+QRCsdmvP8oRqKHP36BWbMhosRhnv2UdidtQEBRpNbR+pZ5pxDIAiV7HI51lcE/+YzYqBBjKKQ+mk14QDT4Vadvl9z8f+2oLPCt6b+F4I+pVo7+dLiRbQ2PKefV95HhGvUhJg9OeGwSZ4vjyPV6Bd7VtT1hhlWuInirz0sJxQVoLrmxl80vatI/0JryeEaViO8zVk9RwidGtgmDZXa5QmIhekr6+1hrfh/YyE9IMQexHuu6k=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR0402MB3348.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(346002)(39840400004)(376002)(136003)(396003)(6916009)(54906003)(52116002)(6496006)(33716001)(186003)(5660300002)(2906002)(66946007)(83380400001)(66556008)(66476007)(966005)(4326008)(26005)(478600001)(9576002)(55016002)(86362001)(44832011)(316002)(38350700002)(38100700002)(1076003)(9686003)(956004)(8936002)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?6ifADCx6DmSKnfJWKTJMzNrEQn4wUAtqpAbvx2Wrky595AqkOUPsw6TR1GqD?=
 =?us-ascii?Q?PmR6MU2np9uvRBQvBQsFLGCw9BfSoBnxwHUJuJngjt2eFjHSmA7mQ7jnjSyi?=
 =?us-ascii?Q?kCqZ2/O5uFesLhb8o0pCe/pql8whg2QjCL6fYtLsJOJQsvP4s6ICjsb7LKRf?=
 =?us-ascii?Q?+stVEUhYOccHS8g2p8NWyOPCqdRABQf7ToGqB/eO2J165OXQ5KyOd06EplBa?=
 =?us-ascii?Q?tBwJE/DYmGsqG6NcVwGy+R29QzUBMko5oOnVVeDp6Y+3H5M/Uqvb6BGQ5I7K?=
 =?us-ascii?Q?G8L4MvotMO3cqcT/xqoeeUdYSMwNaznh1qJQ/Ijc1C2LdqHyY65OW2kbY0If?=
 =?us-ascii?Q?lX4g0+6qHCedo1vcV7PpFhBzdb3gSn6sjisFyZYwyh5BiKW9evhjQFLtumcC?=
 =?us-ascii?Q?2cM6zi/RSKMrv0QkN3nuOGNKw4sOBwDMlLE0vHpMtoCb7PPvucWWSkYRrkye?=
 =?us-ascii?Q?C3cp8QzGNXKr7yTp4lMiFyfcCdAHf4aVBC3vQBd9jSJcM3UmNwJ6yfRzim0r?=
 =?us-ascii?Q?N5m5rL0lw0oyrr93yAg7vdRRBJOO+ksrXKyRTZjV0vZvefJoa4zoalueZdLq?=
 =?us-ascii?Q?L0rLr/2K304fMJJ/kENBDoZCWUsSkE93KmGENxysah0dAcDGnFMBgIBn487i?=
 =?us-ascii?Q?YxKQ439yxNWBmFlFWK87++qAt0OcdqE+Ondm59JmAFMZxRaPS6YH/1x5Z4w7?=
 =?us-ascii?Q?Xbzxbdp48HAqWaqqvv3gy0Gk3/0Cltp0lyglBxzFH9RlG6LUC7b8rnVQtQRr?=
 =?us-ascii?Q?zhWIUUECG8brlnjtIud6WxVF7SSOHuRa3Tzu/MBpv9VB5+JGKFB7L/eyOAEY?=
 =?us-ascii?Q?NUB/1GrLF1RuHo5iXJJF3KrHH/g5y8eQJil0SDUyEbQrh+ETs41wp1pnvWyP?=
 =?us-ascii?Q?PPoahlKZ3D7MNCvda3janBtb0+Dj38etdA1Z/A4syzpNugVuv7NSOE7a+cep?=
 =?us-ascii?Q?ks8FiajUggtkDjhyfUv4AAarM5CSP1l4R2x6JMBPhaByIKGxD9YotO7DGH9v?=
 =?us-ascii?Q?hm6BjARUP4fsF4bmsGgNtc98fhIDmv1vLgsLe5LCzYfX0bIhZOzAvjpQ6nAJ?=
 =?us-ascii?Q?0kC4JSWcDxEctTIDRZ1MaA44HaSL6NZTk4tXr55/HPsfRHHspOvXPNFWnCp5?=
 =?us-ascii?Q?aKKjb3gDTxG+sZAFh9jXVsNEfTRTA2qSLN6GgCWnmyAI8R13FCFe6OMVqTJ9?=
 =?us-ascii?Q?oPe7bDea7Drg0UW4bpy+RJOZ+nBg6ztbJ23MFWKcPwPILtiOj9c+BwtbZ4fZ?=
 =?us-ascii?Q?kVNXJCz2J6pppUJQBLQPt72hO309T2RzcSWnwfqxSeaH1nQYhcBK2PINP56g?=
 =?us-ascii?Q?Y2+YapR3pgUmenSRcZpe8759?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23ecc055-3b42-4b76-f160-08d953456ac8
X-MS-Exchange-CrossTenant-AuthSource: AM0PR0402MB3348.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2021 10:33:06.0177
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P4wlSZsptLFWtdUQkS6EdQvOW2Oj3PvpMAk6k4B90JEMHZvwMEcXBFPQz/Z71ONdLhutT+Rce3dPsrX3MOx3LPgWG7hm2afL8xVxEzMHR5OX2b+A3OgV0ty5V4Lqxjis
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8097
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Michael,

On Fri, Jul 30, 2021 at 11:47:57AM +0200, Michael Opdenacker wrote:
> From: Richard Purdie <richard.purdie@linuxfoundation.org>
> 
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> Reviewed-by: Quentin Schulz <foss@0leil.net>

Please don't add my Reviewed-by if I haven't given it :)

> Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
> ---
>  documentation/migration-guides/index.rst      |  1 +
>  .../migration-guides/migration-3.4.rst        | 74 +++++++++++++++++++
>  2 files changed, 75 insertions(+)
>  create mode 100644 documentation/migration-guides/migration-3.4.rst
> 
> diff --git a/documentation/migration-guides/index.rst b/documentation/migration-guides/index.rst
> index 6304e6318c..287b553195 100644
> --- a/documentation/migration-guides/index.rst
> +++ b/documentation/migration-guides/index.rst
> @@ -12,6 +12,7 @@ to move to one release of the Yocto Project from the previous one.
>  .. toctree::
>  
>     migration-general
> +   migration-3.4
>     migration-3.3
>     migration-3.2
>     migration-3.1
> diff --git a/documentation/migration-guides/migration-3.4.rst b/documentation/migration-guides/migration-3.4.rst
> new file mode 100644
> index 0000000000..4aa5271724
> --- /dev/null
> +++ b/documentation/migration-guides/migration-3.4.rst
> @@ -0,0 +1,74 @@
> +Release 3.4 (honister)
> +======================
> +
> +This section provides migration information for moving to the Yocto
> +Project 3.4 Release (codename "honister") from the prior release.
> +
> +Override syntax changes
> +-----------------------
> +
> +This release requires changes to the metadata to indicate where overrides are
> +being used in variable key names. This is done with the ``:`` character replacing
> +the use of ``_`` previously. This means that an entry like::
> +
> +   SRC_URI_qemux86 = "file://somefile"
> +
> +becomes::
> +
> +   SRC_URI:qemux86 = "file://somefile"
> +
> +since ``qemux86`` is an override. This applies to any use of override syntax so::
> +
> +   SRC_URI_append = " file://somefile"
> +   SRC_URI_append_qemux86 = " file://somefile2"
> +   SRC_URI_remove_qemux86-64 = " file://somefile3"
> +   SRC_URI_prepend_qemuarm = "file://somefile4 "
> +   FILES_${PN}-ptest = "${bindir}/xyz"
> +   IMAGE_CMD_tar = "tar"
> +   BASE_LIB_tune-cortexa76 = "lib"
> +   SRCREV_pn-bash = "abc"
> +   BB_TASK_NICE_LEVEL_task-testimage = '0'
> +
> +becomes::
> +
> +   SRC_URI:append = " file://somefile"
> +   SRC_URI:append:qemux86 = " file://somefile2"
> +   SRC_URI:remove:qemux86-64 = " file://somefile3"
> +   SRC_URI:prepend:qemuarm = "file://somefile4 "
> +   FILES:${PN}-ptest = "${bindir}/xyz"
> +   IMAGE_CMD:tar = "tar"
> +   BASE_LIB:tune-cortexa76 = "lib"
> +   SRCREV:pn-bash = "abc"
> +   BB_TASK_NICE_LEVEL:task-testimage = '0'
> +
> +This also applies to variable queries to the datastore, for example using getVar

getVar to be tick quoted?

Maybe we can link to:
https://docs.yoctoproject.org/bitbake/bitbake-user-manual/bitbake-user-manual-metadata.html?functions-for-accessing-datastore-variables
for the various queries to the datastore?

Reviewed-by: Quentin Schulz <foss@0leil.net>

Thanks!

> +and similar so ``d.getVar("RDEPENDS_${PN}")`` becomes ``d.getVar("RDEPENDS:${PN}")``.
> +

Just something that popped up in my mind but we should be careful when
updating the docs to use : instead of _ since I seem to recall that we
have some ``RDEPENDS_*`` or similar that we could actually replace by
:term:`RDEPENDS` now :)

I've yet to read the udpated documentation (if there's something
available somewhere already?) and check a bit what's handled by the
script done by Richard :)

Cheers,
Quentin
