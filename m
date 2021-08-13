Received: from EUR01-VE1-obe.outbound.protection.outlook.com (EUR01-VE1-obe.outbound.protection.outlook.com [40.107.14.79])
 by mx.groups.io with SMTP id smtpd.web09.34024.1628843265843689471
 for <docs@lists.yoctoproject.org>;
 Fri, 13 Aug 2021 01:27:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherrycloud.onmicrosoft.com header.s=selector2-cherrycloud-onmicrosoft-com header.b=H+5Ai8hU;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.14.79, mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j4/zBoOw6rWfEfXrGjlqQn+29KNvrFHan2H2kEOFIvigubA22S1E6rS9t8K5zQPzm09PMDzzLMpSGPfipB+pEV3j08I5fym8IdVBpLJo9PIsjjTy5JMJvj3t0wR/isZfFJwuTR6wS9A0cXic+8e+n3skEGQHkFGcu2t6KS50JijroWsY+avO1Ud7kHFaqa4A75CvuePnSkY8CREryXsfcT/400tFcApELMZnGpct8G8xo54u/GlSNnmZuNdjtJSv2GDmwYv1YG0k9C2Smuj5AuIe71dzeuCYDnl+Dl0jNDnzf5Kbw9QzsNzSPoCOpVrcdD8NwB3laMHzd6moFK+Zfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NFPdqI11imU/DQCGq1V/Suh1GKWYG7sffVxcgsWtu2Y=;
 b=XeLUDHwtK0r8zYCKWohtWoOruc0aslMuZNCuptcf2O29bKTayqS43DdxCHZa1Tn/OhaQ1banQy0RBMu8pmVdDoHijGnITOZmOpxbbMzKnA11erN0T78zQo8eNX3Tld7jyHq9QdT4srVE4PxX3G7IgfMdCFO6zBF/tDyVXDh5Xe1WjRoGnO6+a87CvuS8rgQB84LkaQwJXjFAtaUAIqRdvjOYlPrwvL/pxhmx9c0Ykto5aYKQe+OBeq7kwNd3aXP+YrzJRWfD/thBWTTMspwnPbYETR009lXBSG05fbu8VXHNqCI7xqR1gHkcihC8+FF9wvJtUNaEZHvNIAU+30kA0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NFPdqI11imU/DQCGq1V/Suh1GKWYG7sffVxcgsWtu2Y=;
 b=H+5Ai8hUmDFunXg0D56BLYLv05C4LO9Cq//9L3hUlxVDI/kg9WM5FPLFjCsHZgK1UvPgjJXSU40C4UsbxP5oUrFSddrz7wKFCOUWIFLgVLdZO+S6KB7vuHDgjzaqryG7azJHNvsO+FNkUokdTB80NDpm5WDIjOmAUCkcXgxsGXc=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none
 header.from=theobroma-systems.com;
Received: from AM0PR0402MB3348.eurprd04.prod.outlook.com
 (2603:10a6:208:24::24) by AM9PR04MB8276.eurprd04.prod.outlook.com
 (2603:10a6:20b:3e7::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.17; Fri, 13 Aug
 2021 08:27:42 +0000
Received: from AM0PR0402MB3348.eurprd04.prod.outlook.com
 ([fe80::cd35:af76:7542:4dd6]) by AM0PR0402MB3348.eurprd04.prod.outlook.com
 ([fe80::cd35:af76:7542:4dd6%7]) with mapi id 15.20.4415.019; Fri, 13 Aug 2021
 08:27:42 +0000
Date: Fri, 13 Aug 2021 10:27:40 +0200
From: "Quentin Schulz" <quentin.schulz@theobroma-systems.com>
To: Tom Rini <tom.rini@gmail.com>
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH 3/3] common-tasks: Add an example of using bbappends to add a file
Message-ID: <20210813082740.ptt5tcfchhapfm67@fedora>
References: <20210812161027.580-1-trini@konsulko.com>
 <20210812161027.580-3-trini@konsulko.com>
In-Reply-To: <20210812161027.580-3-trini@konsulko.com>
X-ClientProxiedBy: AM0PR06CA0126.eurprd06.prod.outlook.com
 (2603:10a6:208:ab::31) To AM0PR0402MB3348.eurprd04.prod.outlook.com
 (2603:10a6:208:24::24)
Return-Path: quentin.schulz@theobroma-systems.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from fedora (92.42.140.82) by AM0PR06CA0126.eurprd06.prod.outlook.com (2603:10a6:208:ab::31) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.17 via Frontend Transport; Fri, 13 Aug 2021 08:27:42 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 856388e2-aac6-4a28-4a10-08d95e343825
X-MS-TrafficTypeDiagnostic: AM9PR04MB8276:
X-Microsoft-Antispam-PRVS: 
	<AM9PR04MB8276097BD19F0FA628B38E81C2FA9@AM9PR04MB8276.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2201;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	CcBkqAykpJN5vCFZWM6X3g828VAd/XTVgnJUdwnHJkeFWeADA31y+MPvfNsZ1ov+7RiAVJnDn36Aj2kNPYsYXMyQrvLJXy4cMRTDeB2J2gxxelxaFrYz4D2p3aFNdQ3H3Y2H31i5FtGfBpT/0cmgcDo3GBQipZrHxFYu0XBHe5PnLJV4Bl2c6IRcotrHf1MR7huPbOBXJNEv0KCCskoeYVpdSTZtMwYYqGHk7KzYl5tMPf+Qi0ogXfJE9+h/XHKS7I4PnK0UF2o878TDg/NVqm87UqWxi1bILV9grmvbvqiqwKI8vBJtTH7B2826np+m48l7eHmtc5Hp1Q2BjT7+HPoDbaAOu6UAI5nUx3V2Yk3nSQ7EXxa5RsfABZSy29YsUZrnjraGZCA2+KqIyA0cyUCHze2KyaHAsbgeIqIibijYUU3+BDw3R64Vk6JV8k73w+8hnQF2Tuj97lMxVWxEevYWDx+AHGNUPDi127wdBMZY1B1NeCBs/q//uorAoQ8ZnqcKsYK4Pk/6zvm+Vpioxb5zPftMlyIsVzY28ERG+zKtc5lWzBqZL88txsy0ixMXClEQJPR6X5GTk+EcyTViOX9JG1C+d0CWiFUcg+J0HAKCgyGZD+p2kPKWiDqi6GqOywQEQWaunJQXWGwcO5sHhB/E0cO8VvuFGNoOyyzOaixO6xnJs+0ZjV32w2NY/1QJd6gTO0YjqOIYFSVQDevi2+5KZpjkEKz6oYAGcvLLBGj+WQ7of5NuT5ABAQnS3jED0OkZ59fO50pMoJ+4SXW3sqZazioPDNas5FdQMhQuTps=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR0402MB3348.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(346002)(136003)(396003)(366004)(39840400004)(4326008)(8676002)(55016002)(9576002)(6916009)(52116002)(38100700002)(38350700002)(6496006)(478600001)(1076003)(956004)(8936002)(2906002)(26005)(5660300002)(44832011)(33716001)(66476007)(66556008)(316002)(186003)(9686003)(86362001)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?c0+iHYfGNW8sDxUbPV/aNwRfpI/sEMnTktNYA8bmdMFyIX+gdyfD+n1goExi?=
 =?us-ascii?Q?c0EN/dFUwwIk65DZ3RdfXVQFohdwrk0KSrMC3wgAYYGiqh0OMWyMdig/gFkh?=
 =?us-ascii?Q?GRYAKLtRVoVB/ch5GjGelP50V06/fxaGxW8RHMsZcJ8UmSJhNlnxU5IjYKsc?=
 =?us-ascii?Q?6JsajEBrI0IAengZ5amV+UHTwCLHnPVw1+KH9j1lLytQmNJxXDyNALl/yusC?=
 =?us-ascii?Q?wcC0TcNlw6QVY+4kNvhZ6B2ugmWxS++ODyGN73vbqVYC8baAi2akSlcsQy6Y?=
 =?us-ascii?Q?JsfIWllOMgSdQvgG2jYGW6+UZgYAvhf8AsBBPvjuYq2Ob2+g0FDzXmQKpcwg?=
 =?us-ascii?Q?kTBBv+XK5RMbOUahlswZKM6OgCqnZ3q31vsBL1IM7sFEaibxcWYiqdQdRovS?=
 =?us-ascii?Q?q58PjW0Ef2n7SUUa0B+kIAWCQFAyAiIa3IIZHtANeInwkdPZizkONlmaE8a/?=
 =?us-ascii?Q?I3fyaTpTh2dhBsbqPFIUQDdrgApBAB1eJazIo9NDfCwiXBoZm0/GQ/LndazX?=
 =?us-ascii?Q?3lsmswWy30xHUswob5o/o1/r2JzIFbSu+Ay+7rE8g0amGIg8VsJDejT2OWJu?=
 =?us-ascii?Q?wBJLtN4bEQi2AxSTvBZj7w9dx4T2AH8W0V4CMabinrC7oJbs+wXBOHZtGNEZ?=
 =?us-ascii?Q?LYh3HtyDeeqsFaYPG+jjroBz/nfTZk5HewGWPOp9Gj5P6aF2fLmtiXrGbxvA?=
 =?us-ascii?Q?b05Zny2RdGJGZCuoY+YTCNFc+6JuR1gUCHyj69fOPkXvXcMQRefYfw8uee+3?=
 =?us-ascii?Q?1LuWSv2UWT3mT8c3qQk0DgeijEAaBptYQOa0CqPLrA8G8aS/NdC43arLjQ4K?=
 =?us-ascii?Q?DESA6/3Id9hycpfOTaeNDuhBqxTOMcg+gKknFfloks97s85clB9aClVBnja7?=
 =?us-ascii?Q?bH86wYK+d7Og1gIg1ZE99i9y4fd5XE/KL1L8xIFzdbUoHLgTe73QOLNZM89Z?=
 =?us-ascii?Q?u6LwIDQBHCb6WQ1bFuBEYU33k45FOp6bJC8IbwUisYEtXTyiFY423KASfDwA?=
 =?us-ascii?Q?lpN8JwE/ZIc7Kk6TpDb2CmaPiWs44vgc9DfST1z8xRHnGwoWnlxF3EN9J9cx?=
 =?us-ascii?Q?x4pvaOc/LOdYQFqWtsGPVXq7C7ivOh3wtcWmTR3WuSVlmeXCpmhRVmSdXSwH?=
 =?us-ascii?Q?DoO+nhar10fEsa4o677GrnB90IyoAsmhQk1Td1eGO124bNwVD65haie3vI/3?=
 =?us-ascii?Q?i4K1dzFvFg2rGwYp+1YrF4EcRrkMhue8lw77OEjw4YgpQclBBE/Dx8x7rixk?=
 =?us-ascii?Q?lGK6szqZwEzYSCKLJZv4SwwOpeS5FpEteGH2rjRQhAVOJdQzmg7qn6uFdxqf?=
 =?us-ascii?Q?kdZLHAwwHymdK36Mn5CiONmz?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 856388e2-aac6-4a28-4a10-08d95e343825
X-MS-Exchange-CrossTenant-AuthSource: AM0PR0402MB3348.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2021 08:27:42.3943
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0PTMKJAejxFtfRVDCJrIBmU1ioqClyzkBYxVpwfaDaZTH8RZxvWrATgcyr3XqonoHEk3gVV4dSt7ZsV+wGHrxZeOVzkSrxG/Xn3hmYOfruNmDagI+qa9w8GYdda0VHuE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8276
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Tom,

On Thu, Aug 12, 2021 at 12:10:27PM -0400, Tom Rini wrote:
> Use the xserver-xf86-config_%.bbappend from meta-raspberrypi to provide
> an example of having a bbappend file add files to an existing recipe.
> 
> Signed-off-by: Tom Rini <trini@konsulko.com>
> ---
>  documentation/dev-manual/common-tasks.rst | 61 +++++++++++++++++++++++
>  1 file changed, 61 insertions(+)
> 
> diff --git a/documentation/dev-manual/common-tasks.rst b/documentation/dev-manual/common-tasks.rst
> index f15e72887c04..87abef9ad52f 100644
> --- a/documentation/dev-manual/common-tasks.rst
> +++ b/documentation/dev-manual/common-tasks.rst
> @@ -554,6 +554,67 @@ The end result of this ``.bbappend`` file is that on a Raspberry Pi, where
>  used during ``do_fetch`` and the test for a non-zero file size in
>  ``do_install`` will return true, and the file will be installed.
>  
> +Installing Additional Files Using Your Layer
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +As another example, consider the main xserver-xf86-config recipe and a corresponding

s/xserver-xf86-config/``xserver-xf86-config``/

> +xserver-xf86-config append file both from the :term:`Source Directory`.

s/xserver-xf86-config/``xserver-xf86-config``/

> +Here is the main
> +xserver-xf86-config recipe, which is named ``xserver-xf86-config_0.1.bb`` and located in

s/xserver-xf86-config/``xserver-xf86-config``/

> +the "meta" layer at ``meta/recipes-graphics/xorg-xserver``::
> +
> +   SUMMARY = "X.Org X server configuration file"
> +   HOMEPAGE = "https://urldefense.proofpoint.com/v2/url?u=http-3A__www.x.org&d=DwIBAg&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=XXgYJ9tKXtc_aBqPPa-9XgJe1nXbWkl8dkudu8oFs_Y&s=0zjLRjQF3x_Fv-B-gOPuwnCc_TfOzMJ50SOySYZMbys&e= "
> +   SECTION = "x11/base"
> +   LICENSE = "MIT-X"
> +   LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
> +   PR = "r33"
> +
> +   SRC_URI = "file://xorg.conf"
> +
> +   S = "${WORKDIR}"
> +
> +   CONFFILES:${PN} = "${sysconfdir}/X11/xorg.conf"
> +
> +   PACKAGE_ARCH = "${MACHINE_ARCH}"
> +   ALLOW_EMPTY:${PN} = "1"
> +
> +   do_install () {
> +	if test -s ${WORKDIR}/xorg.conf; then
> +		install -d ${D}/${sysconfdir}/X11
> +		install -m 0644 ${WORKDIR}/xorg.conf ${D}/${sysconfdir}/X11/
> +	fi
> +   }
> +
> +Following is the append file, which is named ``xserver-xf86-config_%.bbappend``
> +and is from the Raspberry Pi BSP Layer named ``meta-raspberrypi``. The
> +file is in the layer at ``recipes-graphics/xorg-xserver``::
> +
> +   FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
> +
> +   SRC_URI:append:rpi = " \
> +       file://xorg.conf.d/98-pitft.conf \
> +       file://xorg.conf.d/99-calibration.conf \
> +   "
> +   do_install:append:rpi () {
> +       PITFT="${@bb.utils.contains("MACHINE_FEATURES", "pitft", "1", "0", d)}"
> +       if [ "${PITFT}" = "1" ]; then
> +           install -d ${D}/${sysconfdir}/X11/xorg.conf.d/
> +           install -m 0644 ${WORKDIR}/xorg.conf.d/98-pitft.conf ${D}/${sysconfdir}/X11/xorg.conf.d/
> +           install -m 0644 ${WORKDIR}/xorg.conf.d/99-calibration.conf ${D}/${sysconfdir}/X11/xorg.conf.d/
> +       fi
> +   }
> +
> +   FILES:${PN}:rpi += "${sysconfdir}/X11/xorg.conf ${sysconfdir}/X11/xorg.conf.d/*"
> +

Highly suspect this is wrong. It should be FILES:${PN}:append:rpi
instead, otherwise it's completely overriding FILES:${PN} for rpi (even
if the operator that is following is +=).

I guess you took this from the bbappend within meta-raspberrypi so it
would probably  need fixing there.

> +Building off of the previous example, we once again are setting the
> +:term:`FILESEXTRAPATHS` variable.  In this case we are also usine the

s/usine the/using/

> +:term:`SRC_URI` to list additional source files to use when ``rpi`` is found in
> +the list of :term:`OVERRIDES`.  The ``do_install`` task will then perform a

s/``do_install``/:ref:`ref-tasks-install`/

> +check for an additional :term:`MACHINE_FEATURES` that if set will cause these

"The do_install task will be extended, for ``rpi`` only, to perform..." instead?

> +additional files to be installed.  These additional files are listed in
> +:term:`FILES` so that they will be packaged.
> +

Same, it's rpi-specific here.

Thanks,
Quentin
