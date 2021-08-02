Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.55])
 by mx.groups.io with SMTP id smtpd.web09.17697.1627897100957162633
 for <docs@lists.yoctoproject.org>;
 Mon, 02 Aug 2021 02:38:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherrycloud.onmicrosoft.com header.s=selector2-cherrycloud-onmicrosoft-com header.b=bDN4+G3X;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.21.55, mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gm+yI+AUepoyNM95q19LrrwtbbB79PhLqreQ/f/PagFpFumMUEQ8cYWpLxMyCB7fEKl6qYFFDs8QPo7ImX3xOFJfqd1ddvg0hAWW+DqbUuY6kOloxdSVKZGs8SVZiFbVZ6Saz5+486zpkLdpjvBW8W90u+6sjcwtswIOw+l3xhftyfSyLVR5kG1y62QFB95oexvf6L/ShRqnHkMKLc/L6hgxLgkOuDLjZzgJF7nBlp2jSYVPyAOO08Rf+hVLCxRVVaqUc241uC8GHrts7fTK4aS3wdnVetXeAo1LBnN3vq9OI93rZ0f9ZfTc6XFzzOis2L7hNg0l7WPd80BuzbS87g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zfCBB3SBTX4QLch+h3qiYzwhO+6imxQGNpgdCSGSrpA=;
 b=aoHstO4X5B+9UGjzttBAtUFAIiXiVpPtuMO5b/JKkXM0ubOcXBi8kScUUmMSfckoOzHjxAnO6XI3p2yNCrCyrbOFtPqZVWUgLff9ttnvbtjTE3JcPqIfqyb2iryRWMMSehl9LTe7K4ErA27t8H3bOHt1XrbjCb4+th8HlNwpWfXMkzfZdmjQz8gY6hTC8pEy0fHRGswipHF6d+BwfAkHxZ5vxwuMTzEC/l2jwt83LKPMcX4so9S962HzBt+oozkFP4iinSjwwI48m3qJyjsKTPqpD7CRNjJSY4nbIIUMT2kWsV4aS553e66Su+2Tnj3oMSvHhMkr3VoSkeml7Wcj+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zfCBB3SBTX4QLch+h3qiYzwhO+6imxQGNpgdCSGSrpA=;
 b=bDN4+G3XCRcMGWbt7gOA706uUv6FZT+yEMqb9HsJOtRxzSQHw82O8y9uXGOvLAamEoBdYb9zxhr+QEEAKc1uR6EKaRl6ATcSjJkhQ1Fwy/d1PtJS0KUtn62tacI5uRl4aTt+dU06z+MCEZ/+o32aFUX2Yz2KQmEhQDFVsPT215M=
Authentication-Results: bootlin.com; dkim=none (message not signed)
 header.d=none;bootlin.com; dmarc=none action=none
 header.from=theobroma-systems.com;
Received: from AM0PR0402MB3348.eurprd04.prod.outlook.com
 (2603:10a6:208:24::24) by AM9PR04MB8276.eurprd04.prod.outlook.com
 (2603:10a6:20b:3e7::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.18; Mon, 2 Aug
 2021 09:38:17 +0000
Received: from AM0PR0402MB3348.eurprd04.prod.outlook.com
 ([fe80::459d:3240:1c4e:b920]) by AM0PR0402MB3348.eurprd04.prod.outlook.com
 ([fe80::459d:3240:1c4e:b920%6]) with mapi id 15.20.4373.026; Mon, 2 Aug 2021
 09:38:17 +0000
Date: Mon, 2 Aug 2021 11:38:16 +0200
From: "Quentin Schulz" <quentin.schulz@theobroma-systems.com>
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] profile-manual: document how to build perf manpages on target
Message-ID: <20210802093816.vndv4fa25mbypjca@fedora>
References: <20210730160617.185319-1-michael.opdenacker@bootlin.com>
In-Reply-To: <20210730160617.185319-1-michael.opdenacker@bootlin.com>
X-ClientProxiedBy: AM4PR0202CA0007.eurprd02.prod.outlook.com
 (2603:10a6:200:89::17) To AM0PR0402MB3348.eurprd04.prod.outlook.com
 (2603:10a6:208:24::24)
Return-Path: quentin.schulz@theobroma-systems.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from fedora (92.42.140.82) by AM4PR0202CA0007.eurprd02.prod.outlook.com (2603:10a6:200:89::17) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.19 via Frontend Transport; Mon, 2 Aug 2021 09:38:17 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8e5bcb85-1525-4d67-843a-08d955994221
X-MS-TrafficTypeDiagnostic: AM9PR04MB8276:
X-Microsoft-Antispam-PRVS: 
	<AM9PR04MB8276388F6387F1EA6E855C86C2EF9@AM9PR04MB8276.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	FcAudd03W4tBJUM6phWoKt0YDkNKkSiYkElwWnj6IHtvByWX+3h9QxQZW+hkioXzd0ewl61qFM1MJM/o2gklagtylQhTmn5GK+QuW4khJtIKqMrFTvmrGefax4QrmsQh2U195B7qo87bXITp9KSNlnvgk8P/cl9Kf96w60+ikzDka/e2Gb6E85E039I/Ki4I8CbEcRkGZlpYuRVwNhK5uo+WVUlZ47Ge1aD0TOLc0LiDhJeS5M4UVq2INhugoXYL1foMPMaoyUsfEsz0uKqN492cyawkr28EnlF4snrI4YKte2A6fJf9HVAVoEDSyoq05IfaqlOiTlVSeV2q1CNej5GKTsiK+1my2xVRnlMR/W29XRmz7bnTOhzIQpFeqwMaGyfHVf0qX+LzqIR5ytjMEi3DnQthMNsLBCLlckKfI6+L7iDc0t++Y0DpDFStBcDjHl8IUe9ru8DE+I5oMdu9IKfqipT92yY9Ukit6Rj59sgCLe5R5R2wcinjOK9BrFB8a7NLhgzw5m/KtMn7MtvTc/IRoPe4O421RmkzVpzjtW+6Ks2/TDuwkwpxhIiyngLvILkWG8xhuHGh8F2DSgsHC7C2o6bWeJZTTDzC1RtWkrjZpg1xgR7h2orIe40KOi6TgZjDNbnpJUyLQZrPFHK8f5vnpEWtF8tXRrcg7jrTmr7q2z1z7IxfR00mZbM3920M41PRI/FW5lDR9gzjFqOGUQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR0402MB3348.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(376002)(366004)(136003)(396003)(39850400004)(9576002)(44832011)(9686003)(66946007)(2906002)(55016002)(83380400001)(956004)(316002)(478600001)(66556008)(4326008)(5660300002)(66476007)(86362001)(8676002)(52116002)(33716001)(8936002)(1076003)(6916009)(186003)(26005)(38100700002)(38350700002)(6496006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?twcL7dlVra+NtnNOxRGn0sM/+beIcmk2f1l++e5RAYdaJaJ7PhfQFDXrpUjg?=
 =?us-ascii?Q?Nu+qsJpWzwQbm3nc7MvmBOZH9qaCf8GIsm182JcSARaM5oFMF5B3CKqOFNk5?=
 =?us-ascii?Q?FhYsQZ2mbWbbFK/RFJ64QQ8/LBpmY7Ut2otzwKwmJSPoK51gC9UgpAewjzDG?=
 =?us-ascii?Q?zyiFHq9ka7+oiMYUtVIZTE5heMhRxt1VNHR0Muha/E+oCwqf9ZygVGzoveaG?=
 =?us-ascii?Q?7TAB+Zax7SgvTnR7vnRMpq7i+DN7ameqRj5vVQs2sv7KjrkY5B1h0kqnk9AC?=
 =?us-ascii?Q?sJBvqsIh81k42s4qWVBKB4eor0m2XkDkWru9jRzT+aCSJGq6kkv+cgWefAcg?=
 =?us-ascii?Q?wMAFFiCnWCNa7s/jGxCe2nW8859YI92xr9DHpsysxlWPWQssrn/7YltoAQC5?=
 =?us-ascii?Q?UXSKYadPLM8VfVPr8AXbN9KDYb4evJdWFKLcJJrnpj1MmwozB5I1PffTwx29?=
 =?us-ascii?Q?Hu1tdd34PeGUI/Vwx0qzMKLUFDPpA+pWw/mAVidJXuoE2Imj8YAMn787Ykci?=
 =?us-ascii?Q?EyVEa/2TNGp7cY/OmNTsXsAywfEJoUiJysGj1M9rQuoLJJ1BHZXs4NlToeNE?=
 =?us-ascii?Q?PPYIhbavCDGogE/eBtJ8uN5IeurVTeXYI4NMfqg3AxYKycZB8V/JYe/S1mNc?=
 =?us-ascii?Q?ckcoBUoN89OtCabFVVSkE6ui9EBhqjLrsU258MNCJWH1rOHCljADEa/Fi5ca?=
 =?us-ascii?Q?4i9cX0aRUDplj7PP7kQKZYMxa8HKB53MRftIA9lFybJwm52qpELrflxKJaZ+?=
 =?us-ascii?Q?2Kh1r4dEPuRrWPrJk47WjuuWB7FZ6Hr/478su2bBknM4YCKz/EtBUOTOii6j?=
 =?us-ascii?Q?0/0SIw363PZsmUyfvIy+vZFDcEaZPhnzR+X4pXa2C1DsN+wUuTKI4rrKs5Yi?=
 =?us-ascii?Q?2fwJPe0FCcAJLgU9rj1zVCFr+PI8q19AKfvpuubxgTVxe+klrxUDgiRGsZ8W?=
 =?us-ascii?Q?GX15FPF1D4JettnSTf24mSMEvc6fQ9HIaxrgfzLNbQhkwL1aSecp2eQ//Ws9?=
 =?us-ascii?Q?0aqKk0rTrA187yMtQbvH7S0L/fQcc74QYQD/Zs/vDoYMxg4ymqS8EkLv7Yrt?=
 =?us-ascii?Q?7JMxmXKs0bbMx8Ero+FokNmAfdBbx93osq78dncnaB/SkeWQ+8Nak8Eksjya?=
 =?us-ascii?Q?6ugii7zWmXzLKXoCEM3YoDzgf07MGuQllmQ1FDD2LKB/46NmIFk+mfYD8bei?=
 =?us-ascii?Q?MjzyGpg/cTSLDMDf0ziKSOLJ3puUMpImmkOh+HNpWDPteloLiVMwPmAVjrd4?=
 =?us-ascii?Q?r1b0IWHxFhIUhjh8YH7akg1V/4BEIT6QAGybz5O6Sl5Bwc81ojvyYVdG9GXG?=
 =?us-ascii?Q?yAjIgtJO6g9baASv1EVi/3hY?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e5bcb85-1525-4d67-843a-08d955994221
X-MS-Exchange-CrossTenant-AuthSource: AM0PR0402MB3348.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2021 09:38:17.8245
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ijkx3QsVsYs5upNqViNC1f8WUaxDZIqMc4pZfvnodqs4SKakz8qpbulDRr/LZMh4nZ2rwb+IxU3StC6fpOB13NlkWq8Pnhc6bZUG82VGZ1gJKc3sA6687+WhDSH0MmZp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8276
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Michael,

On Fri, Jul 30, 2021 at 06:06:17PM +0200, Michael Opdenacker wrote:
> Thanks to closing yocto bug #3388, there is now a simple way
> to build the perf manpages for use on the target
> 
> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
> ---
>  documentation/profile-manual/usage.rst | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/documentation/profile-manual/usage.rst b/documentation/profile-manual/usage.rst
> index 825290c3f8..ae4efa7f4c 100644
> --- a/documentation/profile-manual/usage.rst
> +++ b/documentation/profile-manual/usage.rst
> @@ -1157,13 +1157,14 @@ section can be found here:
>  Normally, you should be able to invoke the man pages via perf itself
>  e.g. 'perf help' or 'perf help record'.
>  
> -However, by default Yocto doesn't install man pages, but perf invokes
> -the man pages for most help functionality. This is a bug and is being
> -addressed by a Yocto bug: :yocto_bugs:`Bug 3388 - perf: enable man pages for
> -basic 'help' functionality </show_bug.cgi?id=3388>`.
> +To have the perf manpages installed on your target, modify your

s/perf/``perf``/ ?

> +configuration as follows::
> +
> +   IMAGE_INSTALL:append = " perf perf-doc"

Should perf-doc not be the only package added to IMAGE_INSTALL? I assume
one wants perf-doc only if they need perf so they would already have it
in their image?

s/perf // is what I suggest here.

Cheers,
Quentin
