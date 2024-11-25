Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67532D58D61
	for <webhook@archiver.kernel.org>; Mon, 25 Nov 2024 15:57:35 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.87])
 by mx.groups.io with SMTP id smtpd.web10.21846.1732550253314189331
 for <docs@lists.yoctoproject.org>;
 Mon, 25 Nov 2024 07:57:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=kjDIs/AQ;
 spf=pass (domain: cherry.de, ip: 40.107.22.87, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Sx+WdbzWtxoxQmC+x2k+6WvYlFtJTrNU+P5MZePI4xqiNwuO2B2CI5cL43n+bevTZ4g0hz+nHc2+ADIo9b1iPYefk5BrOkk+AmPD7R0isDGGx6ort27lAmF0eCuXxNi6ptRUYHr8s2yueUUoeFo83ytvhvYIF68WUARxirfZtHlRo0UUofASKde5TiyLrTO4jAeIzNV4NqMXdDCCR3XZ4RyZqwvCuLWxZ3zxeJDDs56DsrcKVtFMyMg7W3hIxJKfDNRmpvSZ1JGrTSgUDfiiyVVKnwzW3W/BUWubBocWi5IbNxsrSSuq0L8IgQPCFrfrUgR4cjHCmE4CnBbU8IhSGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AQBN3VrEHmEFNqXI2tV6VmlV7G858/LAgKcmLTFrGpo=;
 b=JshFGZeuA/vAvwp8O9SK36KIb9qSsXt47cw+0nmMg6Y0ci3+NIpHy101S23wnqK8IWR8W8oDfyrWVKngU9MBHRbc4+MCCQGrccRFh411siTBXaFsvArO5+pkGYhyM1fq2aQ8gwEurKHF6rHaqHDApjRutbNgBfrvQ60ozmu2Gf3Ui4dzVKZaAnF8QUAx/3hulA73Y7q7QnIirPEOq6uEOdX+sprcTDE2t4W8M2UYNcBOQ0NiMKvC60jkK60IGthsx8ffylcmqzb73iprRBd4za7OOSxP9tOw4KY0zPY+NgOQ3xFAyBwZPHV9VD2B/6Jo3Mw/+SWG6Ive5UKQKXweiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AQBN3VrEHmEFNqXI2tV6VmlV7G858/LAgKcmLTFrGpo=;
 b=kjDIs/AQtWHc0rutOxDpachefLhEiD2GGYD9U6r+frXZ/nWNOBWJAnjt/NfbZbNkhPU+4ofNf6UvT7JknhlbKSTGvWkI+G0Lj+twUXTZwGdkDv8pvwI405UzPscGJUVM70r6QkWCS2s8YdjOjufgy9NZuly5Vf+XzfdmNhmnOZA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by GV1PR04MB9104.eurprd04.prod.outlook.com (2603:10a6:150:23::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.20; Mon, 25 Nov
 2024 15:57:27 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%6]) with mapi id 15.20.8182.019; Mon, 25 Nov 2024
 15:57:27 +0000
Message-ID: <a8f7ee5a-0733-409e-a9eb-a5531c6eda23@cherry.de>
Date: Mon, 25 Nov 2024 16:57:26 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [yocto-docs][PATCH v2] Update the documentation for SRCPV
To: Antonin Godard <antonin.godard@bootlin.com>, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20241125-deprecated-srcpv-v2-1-89bc3afc78db@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20241125-deprecated-srcpv-v2-1-89bc3afc78db@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0123.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b9::15) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|GV1PR04MB9104:EE_
X-MS-Office365-Filtering-Correlation-Id: cfd88b6c-efde-4051-6c79-08dd0d69dc21
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?Y1MralNJNGh6TkhvVjZGbHVSL2JkVXo5TW1DOFpLVC9rbDNBUk8rakJqY0N3?=
 =?utf-8?B?WGZoNDZKczl1WHMxTWx2T3JsTzl3dk55RlN5RDl3UUxLcUM0T2pRY0I4amI4?=
 =?utf-8?B?RlozWG5iamdDbTltV284dktCN25JRVVIV0dTdnd6Z2NJdGVRdGJ0VXJZS1dq?=
 =?utf-8?B?YlR2TW9Ob2t4eStBd1hqMWVGYTVZNmN0NFg1bWxTS2ZMRTdxOXo0YURKRUQ5?=
 =?utf-8?B?bjhoRFNGQ0o3bGhueWJSWDR4Z2tOSDFpWDRVeFUrRzBhelovMWl3NUh4U2FH?=
 =?utf-8?B?c1BFN2JHajZsUFc1cEU1R1dhUjZnbTBXSG12OGtobUg3cEpNenJ0dFpDa25t?=
 =?utf-8?B?Z0xTQm1DZ1cvbUhZS3NCYkYvR3YyUktKcm0xZ243aHcxUndzREpjMmNpYTcr?=
 =?utf-8?B?L3NMVGVmOWVWcFFSVVk4ZndsR2RXYklRc0pUdTl3MnV5TU4zK05qMEQ5cVl4?=
 =?utf-8?B?L2xIODRvWVd1K3ZwZ05ONGpUeFAvME9JN3QvYlZuVG53ZG5DNUt3S1BtemFz?=
 =?utf-8?B?K0ZZQm1IODRqUWpsbFBQS3NWRWhxNk5abVVUTmZLcHlGSjFtdFNCdFdJcjhL?=
 =?utf-8?B?SWFubnUrY1lVWXZEUzcwTHZYSi9ubXZ1ZGc5bDdxVlJrcVdGZE5sSHIzSnFm?=
 =?utf-8?B?a0IzUkZRS3pIbmwvTUVBczZpUUJmSjBoOGRlWGM3R0YrSW5WQ0QzdHVaQmJr?=
 =?utf-8?B?aDh0MG1sQ1pMdk5TcEVxZXFGSllFemlBNm9ndEF1Wm13V0M0c2hBTitqc3Vs?=
 =?utf-8?B?aEhvWmZmYlNPdlVjZWwzY25MMHFoNSsxMW5ES2swOE5GQnFmVTFiVmlCYWlI?=
 =?utf-8?B?a1hmQ2syd1dGazFUTmZqR1QxUHVsZEEvRzR4V3pNSWQ3VGs3c3BNREdFZGRs?=
 =?utf-8?B?Yyt0OWI0T1VndWNEYVk4R2N1cHVtK1lRNVVObk5BTUVUeE1zb29GQmFZaFAw?=
 =?utf-8?B?OTAxSUJYdGQzcFhPN2Y0eDJhYlJabjdaeDFJcldwa01Lemw1OTBCdEpENmhT?=
 =?utf-8?B?YjRSNXpoT3krMnNGeG1mWXczMW41bS9HVjkxWEo2L2hTcEh2NWlGRVo2SkxC?=
 =?utf-8?B?V1pkRGh4ODFXVFYrODZQYlNuVlFHWGE1UW5tOUVwaTR4Zk9OZ2o1b0pxMzZD?=
 =?utf-8?B?N3owZlcvNDAvMDQvaFRyeGgvb01aUDVrS3l5bnZLRHFSVDdyYWU5dW9WU1pG?=
 =?utf-8?B?OEEzMDJOK2wzRldDajR1OGlUK3F2cFc1cktBMUdzZENrQ2IzMGc1Nno2WkUz?=
 =?utf-8?B?MiszS0tRQVRlY2NUN21JWUVQaU5zaXJPUUJJaWdTem9yd2JLL2NXL1dTbW9m?=
 =?utf-8?B?eHlVa3FrbnI0RkVBY1FxOUEzQWNJRlZqTGlVV09iTFV0Q0FqdTlnb1NUVTRi?=
 =?utf-8?B?VGxYNGxPa2lyLzFaQjZFbHZxa2ZKeEcwY1ZYVG5ldVFsRFBkMk4wR2I2ejFW?=
 =?utf-8?B?UG5nQUYvWHpQWWE1NTZYSG1MYWtoVWVKUTBwNC80WFpLd2FwTnNEaHh2ZEEr?=
 =?utf-8?B?eWhBMEJFN3loK0NHdlRoa2xtSmxkbWZtWnp4WnJLbmtucGJIc29ldXlFMjFr?=
 =?utf-8?B?S3JvcWMxeTNGajFySUxZbW1nK2hqTzJnNEpIVzdhcUdUZjVOMXZmdlVvVXBm?=
 =?utf-8?B?UVBTdTVwTGw3NlJUUFkzeENLUFJ2VGdMT25Ia0hPbVJmZWprSGxQdGFBWEdL?=
 =?utf-8?B?UVlGVUtaZCtrSm5meitQRFJ4b2pOTThoMlBPTXlJaWlRSXdVTU1YOFBOcWRD?=
 =?utf-8?B?dzFjRzZQM3BWNHlwMHI3Q1B2ZEVuVTBEYkxHdHhNQWtuNnNPZGI2YTdSc1ZD?=
 =?utf-8?B?UWl0MEtMMndRM1JLVXlGQT09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?eXJ2OTl3dGhZc0dMQzVHb05YU3o4bmpyZmQ3bEkzN0ZBMHFBZzF4MkJtWGNG?=
 =?utf-8?B?Nlo0OFRiSFcyWDhTNTYxNXdER2g3QmdUSDF3akNvaFY4b3c4VDhwLzQzOEF6?=
 =?utf-8?B?blRtMlVjMGpQU0tVWndwQWJTalpxSDhYcEpselE1RnVKZklPME1kNkdTejFm?=
 =?utf-8?B?YmVDMFh4UFkyZUxTUllCKzFQQ2JvMWluY3pXQzhjaW5YdU5BbjNJbHVFZVlh?=
 =?utf-8?B?SHp3ZllIdUpkT084YkpUUklsZ0dsNDFwVU1FRmVuSlZqRFJWb0JSOFhUNkQz?=
 =?utf-8?B?eGhoTEF6d3ZqS0dYbXoyaDkxMG1naU5oc080YkNJNXVjSmIxekgzcCs3cHJz?=
 =?utf-8?B?djFtM1haN2NkQVVOT0FIam01Rzc1cFNuUnJWQzRkQXVQMWcyTUVIZHZjaE9G?=
 =?utf-8?B?SlhVQUJzdFpIZ0J5cmZTQTJLdW85S01TQkVBcWF4cDRQdmRLeWd2ZWpyVVBN?=
 =?utf-8?B?WTZqemhPaFJUaERZeEcvNnJnV08vUGNkRUQva0hOQk9Ecy9RUDB2eGsxSzFi?=
 =?utf-8?B?UEE2azJVRWlJUktEakVrWmc2Uyswa3JOVHRNWS9lcGlhcHd3TDc0Z1Uxemww?=
 =?utf-8?B?Zy9yRGpyWG41aVI5WHk0ZkRJajY1Znl3RWJTcFJuTW9MRk5ULy9lK1c4MjRn?=
 =?utf-8?B?N2hhMDl4TVNabTZNb2lGZGNVVzFhTzdwL1BsYXVqVCsrR3lwRlNNZ3FyM2Fh?=
 =?utf-8?B?SUpjSDYwZTI3bUhQTjRLL3hlMTFVSGtYUTZPTVN1SitxcmNSazRMSU55L1Bt?=
 =?utf-8?B?am9xSlBWamFSUFl6RkgvQlZWenEyMldEUnFWUTJ3aXdhVEJSSDRjUEpPMG5M?=
 =?utf-8?B?YzVTN0dSMjFYM3NTam95NE82N01LZHpyZDFkMWwvQWJHZnlIamNTR1Jjbnpr?=
 =?utf-8?B?ZHVhTkEvS1Y4eVpxbXpRMDFkMDJxaGYvd2F5MjArZzMvb3hIeWoxb2htVXNY?=
 =?utf-8?B?ZmFTUlB0VFdrVTlyN0E3UmZWVDNEVWh4ZUQ1SS9ZQllzcVJ4azlKTE9PYXMr?=
 =?utf-8?B?eE5Cc0Z4M3lnK2lIcEpzSFhDUjhLeHZLZ2lEU2pMSjNvcEJuWWlVK2E2UnN1?=
 =?utf-8?B?ZzVoc0ZtSUphenNBanpYdVQraE81T1QzN1V6QXA0Sk1rUzViSFY4NjQ3ZGVG?=
 =?utf-8?B?MzFjazk4eUJoNW5yRHBqME80TW9FTEFrMlA2M29oZVY3ZUxON202TW1WUTBP?=
 =?utf-8?B?cjRHR2RvTGhRalIwUXYwVTRxM2Z2RURFRkFoTmFnVmNnNmtWdVJrR0I1TzRG?=
 =?utf-8?B?Ynk0UnIvUHhSbFQvV0prZmVkazJYc3FNTnkwcmlCSkhvRkJ4dVhEYWk3L2tT?=
 =?utf-8?B?VkZlQm9sSmJQejVaQy9mTVZ5M21WbkhTZmFudVdkSGRIZE1iMThiVjJPNFZC?=
 =?utf-8?B?dTgxb2l3ZGJDalBTY2VlOW9wcS9GTGxOaGkvQjZCTDg4WE5jSFFHZmpjZVFw?=
 =?utf-8?B?UDNxR2NGYng2Mk1JUWpKTDVEQkdlSTVncnlvMzV6cllrM21DL3UrRnFlN1Jj?=
 =?utf-8?B?Ny8zODNBakUwNWZBYTVUUkJ4T0JyYTh0cjdQTnhodU5McUZuazA0a0JrTTIw?=
 =?utf-8?B?RjNPYXduWUxIUWt6TGdZTzdZR3AxNENGQ25jaDZRbDFYaDZVclB3amZieDJ5?=
 =?utf-8?B?NjhTczhjR0p3R2dSYll4QmFUVFp4am43empnMW5Oa3hHQ0x5ZTd1YitIczRl?=
 =?utf-8?B?V2VScVNpTVJZQlh5a0NtVXNSRHZqZmZ1WUpmTFpkZDk0aEszcGM3K0NBempl?=
 =?utf-8?B?NXE0NE5VaUdWRS9ERHBIY2RWZy9ZcmtST3pzdFNqem5vaUZ5NmYxTm9nVUFC?=
 =?utf-8?B?SHFyTjhOc3UrOUJzOFlKRGphNlE0Tjc0NVJ4bDJlZ3hab1ZaV2tScWQrT2lu?=
 =?utf-8?B?WS9zbzNMQk9OZFNTaEMrMnRpTm5IeEcrVCtXUkUxQlJQc2MrWFZ3bll1eW9T?=
 =?utf-8?B?SWhnaDBNeGlSTXBVdXliVkhaa0JYbTFWMzYzb1dmaW12Tk4xSFExdUd3SW5S?=
 =?utf-8?B?Mlg0L0F1TE1UQkhQQ0xYdTVMTHYzR0NSdjMxeHR3VG9yYW1Od0U0OFpvUk5M?=
 =?utf-8?B?bTZLSld2RnFtallMdTJsK3ZsZDFPcHZycDByTDJGTTNJbWNGL29CQzhEbkIz?=
 =?utf-8?B?ZG44SVh1R2dvUHYwSzlleVBOZjdWd0daOC81MUZCemdQb2M3LzdoMWJNRE9v?=
 =?utf-8?B?Y1E9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: cfd88b6c-efde-4051-6c79-08dd0d69dc21
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2024 15:57:27.4623
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HQJFs4lhbDIedDXFXb1bl1hiuHzwzoqr5Y/3s/qmDh5NxoqCiMH1i1czpntJVBT8Mmfu5FDp6kFBwhtCOTFNC0khGSqBQb90z90UAI2BN60=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9104
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 25 Nov 2024 15:57:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5801

Hi Antonin,

On 11/25/24 9:17 AM, Antonin Godard wrote:
> The variable SRCPV is deprecated since 4.3. Instead of including SRCPV
> in PV, including the sign "+" is enough for bitbake to add the source
> control information to PKGV during the packaging phase.
> 
> Update the documentation for SRCPV and the places where it was used.
> When instructions previously referred to SRCPV, replace by mentioning to
> include "+" in the assignment.
> 
> In most examples, "+git" is added to PV as it is the most popular SCM.
> Simply adding "+" is also possible, although it is better practice to
> include the SCM name, so give that example.
> 
> Update the gcompat example with l3afpad as it didn't include "+git" in
> its PV definition anymore.
> 
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
[...]
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
> index ec4d7ab73fe3ac1bc64f5378c65d19ae0b749809..f611edae9f37097734234805faa34b1850e5cfd1 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -209,12 +209,11 @@ system and gives an overview of their function and contents.
>            SRCREV = "${AUTOREV}"
>   
>         If you use the previous statement to retrieve the latest version of
> -      software, you need to be sure :term:`PV` contains
> -      ``${``\ :term:`SRCPV`\ ``}``. For example, suppose you have a kernel
> -      recipe that inherits the :ref:`ref-classes-kernel` class and you
> -      use the previous statement. In this example, ``${SRCPV}`` does not
> -      automatically get into :term:`PV`. Consequently, you need to change
> -      :term:`PV` in your recipe so that it does contain ``${SRCPV}``.
> +      software, you need to make sure :term:`PV` contains the ``+`` sign so
> +      :term:`bitbake` includes source control information to :term:`PKGV` when
> +      packaging the recipe. For example::
> +
> +        PV = "6.10.y+git"
>   

I believe this is not properly indented? Missing a space here to follow 
our standards?

>         For more information see the
>         ":ref:`dev-manual/packages:automatically incrementing a package version number`"
> @@ -5152,7 +5151,7 @@ system and gives an overview of their function and contents.
>         The :term:`LINUX_VERSION` variable is used to define :term:`PV`
>         for the recipe::
>   
> -         PV = "${LINUX_VERSION}+git${SRCPV}"
> +         PV = "${LINUX_VERSION}+git"
>   
>      :term:`LINUX_VERSION_EXTENSION`
>         A string extension compiled into the version string of the Linux
> @@ -6720,9 +6719,10 @@ system and gives an overview of their function and contents.
>         For example, consider two recipes ``foo_1.2.bb`` and ``foo_git.bb``
>         where ``foo_git.bb`` contains the following assignment::
>   
> -         PV = "1.1+git${SRCPV}"
> +         PV = "1.1+git${@bb.fetch2.get_srcrev(d)}"
>   

Getting back at my original comment in v1 (forgot to answer again there, 
so doing it here). I'm not sure this makes sense as an example as it is 
not necessary anymore since + character is enough to include that 
information in PKGV (as far as I understood from the patch). I would 
like to avoid suggesting using something that isn't relevant here (or 
discouraged).

I think we could simplify the example. The point is not necessarily to 
use % with a git-named recipe but rather that a git-named recipe is not 
going to match "git" but the "PV" defined in the recipe. What do you think?

Otherwise, I don't really know what kind of example we could provide 
that would match the state before the + character behavior change.

Looks good otherwise!

Cheers,
Quentin

