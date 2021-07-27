Received: from EUR03-AM5-obe.outbound.protection.outlook.com (EUR03-AM5-obe.outbound.protection.outlook.com [40.107.3.53])
 by mx.groups.io with SMTP id smtpd.web11.1769.1627395303220475391
 for <docs@lists.yoctoproject.org>;
 Tue, 27 Jul 2021 07:15:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherrycloud.onmicrosoft.com header.s=selector2-cherrycloud-onmicrosoft-com header.b=J1GkjWaX;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.3.53, mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nQndGoanLE3zEgx1u7eTh6OOI4TwtAvHK+U+o1EApoMmus0IAI624x4FAc4vgeXnUSBMTDCbjYs97pUytHhpBgpDTK7fhTh+MZL0d8B7C3jRUZxkalSkYt5ycVc1QHIIpqd5X3ywN5LWfZJkUC1R/CU82KSo7WpPVIswf1E9bsMuSl0q9L5Vr33ldvMa8I1fvHNzj3eeqGeuv+hewQte//BBSY2P83MIYcApabwMrJRmffiZmmawnINRJhwcAcN02202Av/Y+p6fkXe0zPyxltO2PT8KxoEVfQw+E6KyQ9P7CWqplf7Hy6mmGOib9G7e5Q2Xlnu9x0RV+DyKfztypQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cn3l09qrjJAFaDtaFoqN/mjbQOPAKu95N7xX1YjH9X8=;
 b=AQKFFtwCq6yC15Ejejn8itGrU+8+Z70omp+S7v8uN4NTM44nj40OO+1FZtMRS4SCLisza8HMeMGII3ICT2C+L+cK6tFSC6pRxym41El9kIVu6vXcKFTt9mGJ8wlgExUIoASCPSEX07JgLgQCtzN7p/cyGQo7KTGCurnze/BqBoHJ5CS2K39DoXbf/q1WiDu1sH78qwPWTa4Mk0hzoq9BUCQOEAImnj68VZzTLTHPUX3DM3FmjlbWNrh07Ugju7hH5o35aTdHFDXAPhRvLlz5wYkxcxwyjsCp9RguSx/ek4qhYbt59gSso+Wic/FwuJMgcW3Fe/9RJf779tKOP7ZGZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cn3l09qrjJAFaDtaFoqN/mjbQOPAKu95N7xX1YjH9X8=;
 b=J1GkjWaXShoAX3UUy7e7G270seMtz/uG92rDZ+hkUJZgrkb3nG5S51dDVECvDWHrsbgVFY9cmCtUZ66CisCIcKHJE1oN6lbalxe2eeMd22RUtjYDPoR3YZGUD/jpxYF3J6Rl4RD6hsqmyiUuu9K34yQspqL08W+Njh31UPlc52Y=
Authentication-Results: bootlin.com; dkim=none (message not signed)
 header.d=none;bootlin.com; dmarc=none action=none
 header.from=theobroma-systems.com;
Received: from AM0PR0402MB3348.eurprd04.prod.outlook.com
 (2603:10a6:208:24::24) by AM9PR04MB8226.eurprd04.prod.outlook.com
 (2603:10a6:20b:3ea::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.18; Tue, 27 Jul
 2021 14:15:01 +0000
Received: from AM0PR0402MB3348.eurprd04.prod.outlook.com
 ([fe80::459d:3240:1c4e:b920]) by AM0PR0402MB3348.eurprd04.prod.outlook.com
 ([fe80::459d:3240:1c4e:b920%6]) with mapi id 15.20.4352.032; Tue, 27 Jul 2021
 14:15:01 +0000
Date: Tue, 27 Jul 2021 16:14:59 +0200
From: "Quentin Schulz" <quentin.schulz@theobroma-systems.com>
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH 1/2] documentation/README: improve BitBake manual referencing guidelines
Message-ID: <20210727141459.otifwpfjjigvu2gq@fedora>
References: <20210727141200.128209-1-michael.opdenacker@bootlin.com>
In-Reply-To: <20210727141200.128209-1-michael.opdenacker@bootlin.com>
X-ClientProxiedBy: PR0P264CA0090.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:18::30) To AM0PR0402MB3348.eurprd04.prod.outlook.com
 (2603:10a6:208:24::24)
Return-Path: quentin.schulz@theobroma-systems.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from fedora (92.42.140.82) by PR0P264CA0090.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:18::30) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.17 via Frontend Transport; Tue, 27 Jul 2021 14:15:00 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 627916e0-e8b6-41e4-367d-08d95108ebec
X-MS-TrafficTypeDiagnostic: AM9PR04MB8226:
X-Microsoft-Antispam-PRVS: 
	<AM9PR04MB8226ECCC6805BB172D527301C2E99@AM9PR04MB8226.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	9rU07cmpHjviTcP8/hIFcsUZ+dNdbhzzs4EU75Kp0vxjqtlmHK0mt7Qemw6NBj0zNxY2l7/MyK9w6peTS2eGHEJyJFzDdXdaphrjbPApfuAoz8c4Gs6Vg7ZMjbuBySFFT1AVBeUSXgIr8x2ugqwv13lwU9PCjw4MpIvfwe/q2a+aPQT157UXAC2ooDpAfE3bdD9PDin/Ohw/pCePWT/FEerSFdxnRZUEVw6CmjYRemHtkZYTJR6pSAF/YVo72hBp40PfPFN/WDDQj+oj2ukxINUhMSBvW+4Ng4E+l62xAE4Me3Tyn8k5x19un5FJu05s6X5xt+9W5JLH0wQjHJQHjdsgpmrkKsP6lYy8MF3tN2cq3A9T+7ywi+rFKPCw3xxeEBX1gGDFdzypPTQ0hEgV1Pt0eQ4U0bBziec8k5LbzrJQ1Fz0PcMqVxJ9/iLU09tdnizT9hneyHVLOZch/TKVbBnc/TA/74wegEsTC/WHJ3rnEz8Y6Wn8sZurBoI2WsFli1FovWAY4P+cYn7qstTJnvAeCb7v/70/3OpIdOfDhrP4G/TSghRroM3f9GmDG2XDHNYEyXewjtqEv/w6r1nIZvsr8FP3pjs2T6/eg414ZhpuF/PIGZaCbafIqVz7K5EGkfXWUh+iAsxpwM8wX1GJCS3MJWSIu6FmAe57b8o5XxMi3t+u3mT1VRkxLy4z8lZ3FLJiYyePCRk8vUEpAPBgig==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR0402MB3348.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(39840400004)(366004)(136003)(346002)(376002)(396003)(5660300002)(6916009)(8676002)(83380400001)(55016002)(33716001)(4326008)(956004)(86362001)(316002)(66556008)(66946007)(38100700002)(38350700002)(6496006)(66476007)(2906002)(52116002)(44832011)(478600001)(26005)(1076003)(9576002)(186003)(9686003)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?kW0MB7+bMCpLikDEMkJeXyX+kWVEIF2zADXAsLxbTlfFurv0/ZCH88sCBaV2?=
 =?us-ascii?Q?a1kxnanqs6TSqpbST98MehiEfLcY9BHhdVo/2vDb7HPZ3F92WvbSdCh1CVj4?=
 =?us-ascii?Q?kvsUnxZS7mIP23xACjbFKF1acQrMVpSfOAc/sTAOh5bHBpDxNKtjrzClw6jn?=
 =?us-ascii?Q?29oPN/DvHNTRxN6JHpF8+TCf1c510XsSj0bR6jIfY6HUxVO6nu3H8i4tnN/8?=
 =?us-ascii?Q?I5He2n1vnRqpmVtqGYgbsZ8o6pjKc/wgtXTaY3ZWwlJMqtq6vlFmPaDVAMAQ?=
 =?us-ascii?Q?oZd819+SuXyRbjSI0ZBxxlr9f8Oki+qYEjKS5jefM3khFwjIZV9/W8eLWXUF?=
 =?us-ascii?Q?Br/g5ZHhbPYxHdB6cjRcrRiZrSt63nm13oQIfleLsYsVhXTuzPKF83zzBuRH?=
 =?us-ascii?Q?ExnLWXI1EVfMdKL+zcz3GOzikjTw+ElnlkGw0mn6PlW2JZ7QF1Cis5z4pI7U?=
 =?us-ascii?Q?N5F+sRr09P2n41YUkljwE1uKyrCtf0BmTdQtkXtYBRZRKBoRjc0ci2ccTamj?=
 =?us-ascii?Q?nETP9mUl2rrgUikRfCWk5im9lR7RE2pVj/+qiInrm8xFkTrhJySUKOL+CIQa?=
 =?us-ascii?Q?+Ujs+jxqbltnyEHU0YueycFHDxZ7s1zd9z1uBXtrFhWOAfHlfBEeCVnOwiRO?=
 =?us-ascii?Q?9IC2M2f8Q/lZoGPgBBNMwH60x15vy/g4JLC5M/GVOzbIez6SpXdj6Z12Kg/+?=
 =?us-ascii?Q?b1sYzd6XcbdQvSl/uTMbhFgYJ8CUgj/vLcbpxuiPxpJkIyDaYhg6EPjTm5BS?=
 =?us-ascii?Q?1uj+Pl+nise876DhWnsL2cLiOH5kKbem1SAqme3kC73sqrBOGs9kD8i0ykxD?=
 =?us-ascii?Q?IVQsfI3Bi8OSQuiv+AHhJoCZ26j/0E0RXm/WNwGI3DONdyq5PKpMnTi5zwII?=
 =?us-ascii?Q?/eAaVvxnUKKDs9H96Ym0rNo6z09BiID1eTLC5Y2/zZkF1fLHFWv+C7oBc9uN?=
 =?us-ascii?Q?bUmEoIoluwjYQI9C8kIyQSE7IXXAqOaN0Nz1sFIYeC1d2JE1ibECi7BDpyYs?=
 =?us-ascii?Q?1GxEo8AyR2EX/8OAcSxSlrRYR8HoYrxaEsCUfwBIBpUPmiyfLYmiSDmCtFwA?=
 =?us-ascii?Q?GVad333QcGQRdkgiTIdPvIqs4NiLPssjQT74q8W0oJqDBN1ZZ02+Bbf4Idof?=
 =?us-ascii?Q?aD6jKGQnw7I9VxTMapQZZkh99ImYwSjLegixhWCsjaUfk2wn/3n1N0/Wi5CY?=
 =?us-ascii?Q?3cnFQHSEtZf3l1KqFIIC+wFV09Y9iMC7EiFfogvHYcmEu7uCdhdjUl4n8Jsl?=
 =?us-ascii?Q?xiUK4iiMBFHOV4sPeiCKRZrilF1zpunlKyBEiO1EWUa35MPYG7/ft/BQDntC?=
 =?us-ascii?Q?5NgfRrSx0V2Bautej1pe1X83?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 627916e0-e8b6-41e4-367d-08d95108ebec
X-MS-Exchange-CrossTenant-AuthSource: AM0PR0402MB3348.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2021 14:15:01.0539
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Bz1zEkRsGwUNxd11pzHUJoU9Huv8Aa+Hm8sdtp73aS+gGQa6QT/gWAgTV7l9jKqt7AtIqkT9+wDbjFw3S01UNoHPZKOuBgYFYXmj266I7kMPKztD2SFZXHuZUlU2aueW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8226
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Michael,

On Tue, Jul 27, 2021 at 04:11:59PM +0200, Michael Opdenacker wrote:
> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
> ---
>  documentation/README | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/documentation/README b/documentation/README
> index f9e803a28b..1d4d213076 100644
> --- a/documentation/README
> +++ b/documentation/README
> @@ -328,11 +328,15 @@ The sphinx.ext.intersphinx extension is enabled by default
>  so that we can cross reference content from other Sphinx based
>  documentation projects, such as the BitBake manual.
>  
> -References to the bitbake manual can be done like this:
> -
> -  See the ":ref:`-D <bitbake:bitbake-user-manual/bitbake-user-manual-intro:usage and syntax>`" option
> -or
> +References to the BitBake manual can be done:
> + - With a specific description instead of the section name:
> +  :ref:`Azure Storage fetcher (az://) <bitbake:bitbake-user-manual/bitbake-user-manual-fetching:fetchers>`
> + - With the section name:
> +  ":ref:`bitbake:bitbake-user-manual/bitbake-user-manual-intro:usage and syntax` option
> + - With a BitBake variable name:
>    :term:`bitbake:BB_NUMBER_PARSE_THREADS`

I'd rather not specify bitbake: for terms so that they can be overriden
from within yocto-docs if need be, without needing to modify all the
refs spread over the whole git repo.

Cheers,
Quentin
