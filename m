Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0C87C54FDF
	for <webhook@archiver.kernel.org>; Thu, 30 Jul 2026 10:24:24 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.23])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8487.1785407062367525299
 for <docs@lists.yoctoproject.org>;
 Thu, 30 Jul 2026 03:24:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=cUsx+V8+;
 spf=pass (domain: cherry.de, ip: 52.101.66.23, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gV3FeuIFltSWRfzs5bRlFlJPuBvgL9gt61zKGB8qeY3z0/rljYSMp/cuwyyzZ8/w9mw3lK1r22mTrzDxBSn8GjWhUCd3URJJWoO1+wNomJeuFUaTthj+U0UbS1F4bSx+htC7hniLetgHdWL/mnCGcthtAGS8dhE+zcVf5JUdKoTUYSXixtYmsW38BRMMPqkykyxa0FJmVNBAUe0QibHf5gcf+MGx9XUh82RZoY9cmSQ80/DiftRvvaKmOtgtbskQ38Bzg1oNHGvMhDxkCfDojvPuycdRkCLNXSoOSKinbHorTIE7doPwIqvCTax0VgOWQLg1GSGwK0x39Gwf8KaIuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yy/Y4oUcPhC6ZLXQt5PQgiCnww/gPy1PGRBARqGjRM4=;
 b=w9lis6bAl1TW+vbQOsPYCZ/xNEaIzXeMfzlz9foTVXhVy5X+dsTxwAiGYRFrawnFd6xBjPjwkIhARXUSUPvhDEIgMrdU7ZKBUkaXib92kt7zgFP4NyD+3MDYLRyiGi6EjC0YJJTkuZZ/Wzk2joaMq00XLEini8PmHUZPjsqUObX5psw8SVu6IRAzhkXPkyaqEnTF39YbkE4+81gFtZ1ORm050uNj7K3F44+bdiuub8BV7W/t0JH3ZtpKu7qWBEkzrG0VRPk82scFVPUh/bVxOp/Jjq5JWqYBXiORlJpKnC6qQL77aYKx4c2Wu3g8M9od10B5kwp9we0LJ8+VgJPqFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yy/Y4oUcPhC6ZLXQt5PQgiCnww/gPy1PGRBARqGjRM4=;
 b=cUsx+V8+l0Rr1bBdgEEk9Ly2yFZnTMiOtwWaiTS/7JHEJEvQaDfEP7spbvl1jC0E0zGxO1SQ4WTyq5WOpj/uT2v7rcshGryV941VkA3wKKEiRvDKMG4HxEa684cO9aNL30s8cre0SvTAm4ipeFgqgoOBuMMjLPGg4XTA1HCDPyU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from PA4PR04MB7743.eurprd04.prod.outlook.com (2603:10a6:102:b8::20)
 by DBBPR04MB7595.eurprd04.prod.outlook.com (2603:10a6:10:20d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.13; Thu, 30 Jul
 2026 10:24:18 +0000
Received: from PA4PR04MB7743.eurprd04.prod.outlook.com
 ([fe80::9a4e:252f:2fd:97b7]) by PA4PR04MB7743.eurprd04.prod.outlook.com
 ([fe80::9a4e:252f:2fd:97b7%6]) with mapi id 15.21.0270.012; Thu, 30 Jul 2026
 10:24:17 +0000
Message-ID: <ac3f0125-efe3-456f-902d-c616aadcbe07@cherry.de>
Date: Thu, 30 Jul 2026 12:24:16 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH 3/5] sdk-manual/intro.rst: link to sysroot term
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20260729-sdk-clarifications-v1-0-661e65201bc7@bootlin.com>
 <20260729-sdk-clarifications-v1-3-661e65201bc7@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20260729-sdk-clarifications-v1-3-661e65201bc7@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CW1P302CA0004.GBRP302.PROD.OUTLOOK.COM
 (2603:10a6:400:291::7) To PA4PR04MB7743.eurprd04.prod.outlook.com
 (2603:10a6:102:b8::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB7743:EE_|DBBPR04MB7595:EE_
X-MS-Office365-Filtering-Correlation-Id: 08e16407-3428-4080-d39d-08deee24b630
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|366016|23010399003|1800799024|6133799003|56012099006|4143699003|11063799006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	sAvvWjyANVjhogw2jF9rlT8SUckbBkrE8Rswv7sGNzCmQo+pgwhyKpj7YVkT/aXZ+tz/TWec9P89zUBggpHsdyzCdYuoHGI0Cb9zDuoQWoQ8JYBNEea9H1Ng34GvAC6PtVscOrgticJey+5xQfegsr4Sg4eMmE6wIHTrDeFl2p18NTPjmkhwv2/qKogrG3virPWZQqgwQO4f53T8LUDoviCdfsAXRD9ukhDX+WqBHWra72kDpA6bRQ2pODsN+xjLBFJ4kmSWstiCUb+s4rMgU7h5Tc4i5X9E9N7/TOM5tSEVORuRdx8GePbOKVuitc977pMWiZeEMI04Ur6P063aRdISxsmeIITWsJjuzTVqhpTTvZLHly4LQnEbySZfWO+6VZq9N3QhizfdrAMo/Se8Wc0V3WQQRgS7VjEWahEgqgJeykqPw2gvXVMMDoXAkCxowfGL82BBGu3NAVMLpsGe/CzevkT8LCzR1MO+9oUmuMVutjhvExkD3G64grNSFubrYbXVXU1koQEcGAuqmxpJ0CNGJ//mv8Bsi1xkkoGptzkALNVOb6l+YfHe40bymYcl5O/ydzWyVpctKY/8HkOW7uK74Uk56HCjzUXyQdIrSJN93bJtLS7HKBHq2jTN4f6J9ePt95Caf6NRcUzTTd1cx++7rEnTr/p4ltCRRosyxRY=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB7743.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(6133799003)(56012099006)(4143699003)(11063799006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?SEx2bzJpWnBKQlM5eFYzU0piWU9paGYxK24ybTBoZURKL0NRcHJ0d2p2Umta?=
 =?utf-8?B?Yyt1eTdBd2ZEd1Jrc29jWTFwWXZwUHNHZGlUcTMxV2VHTHBYdHVpc1MzMDBu?=
 =?utf-8?B?anJzWE82ejlZOG82MjB5SHF1OW9Jdy9mRllXSTZUU2xJTmdaYitqSnVXR2ht?=
 =?utf-8?B?YjZpcnBXUGoxVWdSdnl2bStQVmdhVU9Vc1BEWC84VDBjUjllOFVlcmEybnh6?=
 =?utf-8?B?aXpLQXZrcDEzZFRFMjAzL0phNXRxNUFpTCtSckJlYy9lQnFuci9mSVBLUS9I?=
 =?utf-8?B?akx1RmJ5QlJnNlVQeDFJRHpRV1BvQm1WcE5lSkVhKytPY2htdDJVVnBaQjZ1?=
 =?utf-8?B?RFNGNlkyWnZOSi9jMmdJaUJEcG1lSFdkRzJReitEVHpFL3Q3R3RZa21XekNh?=
 =?utf-8?B?SXlWaGZHK1l4VVBYRlpvSTg5elk3VStBcFRYSVdYNGtlTVVWb1g1WDdpRmdX?=
 =?utf-8?B?NloyRy9pNE1BMkhRUy96MXhHTXZRNmRsNjEvMkpPeWxjZ0N4dk9ETHBCbmRz?=
 =?utf-8?B?dThZZWlhY003UjhRSlcyeUxqRXh3U0prT1FqU0pCMm8ra1FDNStnNnJ0YXow?=
 =?utf-8?B?RTJOV2FNYkgxSEg3OHY3OWRYVU8xRURQTWhEL2VQVGZJcmliTDMwc0pQdlV3?=
 =?utf-8?B?UkZmQ3dBejUxWHBOSjRCNnRabWhocWdKZnhZY2JlZlEwMHc0SURtdlMrbWFM?=
 =?utf-8?B?aVpyWGd4UHdtb2d5Z2ZNNGhBOXRheHk4ek1SUWRDY3M0RjhjRXh4UHNxYVRH?=
 =?utf-8?B?UG9rU1MwRC9DSDl5S1pmTVR2Z2FZVmxJM2Jza2h6RHdPb1M3MGJKUFhleHMv?=
 =?utf-8?B?Zm9kNC9XMjZpdWhnR3J3T29hcERmVXlNbmRvdDQ0QWFXcFQ0dmJ1ZS9jQ3dx?=
 =?utf-8?B?Tjh5NjY2QkE3TU50ZGpRTVFDUFNwcCt1anRESkhLZGZ1SGtydHhCYVJHN1Bv?=
 =?utf-8?B?VlVDaTlWTVNDV0xTSFBMY3VJS2VZQ1Fua1lJSGxGT3FjdXkwbzh2dklnYkpI?=
 =?utf-8?B?SEdTMUcxSm5WNUlwdVhkTGdGYVFaakMwTUg1cjlCZERsN2wwY2NXUjJxMlov?=
 =?utf-8?B?L05mczhqS2xNZWdYc3BVaVVFWVhzUFkzeWFLS2crcWd3ZjRaRnFvWXg4YThk?=
 =?utf-8?B?dmVUVzJwZ3lBeVcyOVNVUEdUd1JJUEg1RjVnVlZJVnBMbkpkeElhMzRwRE5B?=
 =?utf-8?B?dmFNUUpzZ2lyNzd5TU5Icnd6QW1mTUFIYUJTY3JrNUtFallnZUZJTFZoS1hZ?=
 =?utf-8?B?d2pDMUZEdzZMNlBqZFBIeXpnWC9INlBRZkhTZ29Pb1NqRXRDRk01SjZQWDJ1?=
 =?utf-8?B?RC8rQWVHUEVHSzBlRXY1SElqT2tDK1lBMmV0M2pFYTcyYytZaVdKSEtlZkFP?=
 =?utf-8?B?aXkxMXJJVHpIWk1YUnVpQmpKZ0hmQ2lJb1FwMW1NZnpsaWN2OUI1aUh3OXdi?=
 =?utf-8?B?dExSakNvYVlvSDI4Y3diQmE0ME95emlDTE9YRE1aYWV2RmI5ZkRGVTQ5K0Nj?=
 =?utf-8?B?eWNwQ2trOUpBT0xkNmsrQjRhMHVHNHo5MmVQVkF2V2dFRGRYV1pGUmpmeURF?=
 =?utf-8?B?NjVHMWVSMzd2K3FtQUt2NkwrR1FiSWc5V1VaM1ZWWUdKL1FESWRRNmNvay9E?=
 =?utf-8?B?N0Y0R00xaW0xeWx1cmFYUVd0dm01L3hSNGZZcVlNT3FuNG50YTRMZ1BXVUhk?=
 =?utf-8?B?RDFNWWJiV1NxZUpJRzBNc0FQVFV2c2Z2SDBSb3YzSXRjZzFDU0dacElVcERt?=
 =?utf-8?B?ZmtQRkFmQjQvSjZjSlpnU3V5NWQxcm8yZDFla3JRbFErZDRtRHRHU1pRbHNG?=
 =?utf-8?B?Q0xIOXlERW53RUFPV2U1TTQ2WGp0d2lWd2VlL1pnZjBqM0NNcjM3ZVBYd0dX?=
 =?utf-8?B?QnFZV2dMUndQcUJxY1VXTStWbVR0NThwYXFpeGk1R1NvaVBMZkdoeEwvK2Q2?=
 =?utf-8?B?NzZYcnhpWkFoR1E5SkZKQ0hqR1JWN1VOSWRLVVQ5TnJlZ2RXL3oyY3lSL0o2?=
 =?utf-8?B?OG81TXlTU1JLdXI3ZC91YVhmWTkxNWNsck1qcFZ4cTE0anF3dmUrZ3h5Vm8v?=
 =?utf-8?B?c2t2NzYyVCtIbVM3c3BSZmdWU2ZCRVIxTzNFT1pRWUszTmw0TWRMRjR4dU4r?=
 =?utf-8?B?bHJCdUlNRmhvYkt6cUpGbmN5VjBzMHhoREMrY2wwd1dVeS85ejdXMEE1dDdt?=
 =?utf-8?B?MlphVTZpTWpwUlU5UWhFSkFpdlZrRzF1SjlWNUhNNWhFMFVlTXYxYnUwZzcw?=
 =?utf-8?B?ZHVzeWw5bmdiUHBzeUpaQUpIVmFCd2FoL0dzTENiS0dOUytzYTFLNDZaY05E?=
 =?utf-8?B?VnpRNFk4ZjlTWkRZNDkzQUg4bGpHN0JsVnUrTGZ6cmdUREdORHQ2UT09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 08e16407-3428-4080-d39d-08deee24b630
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB7743.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2026 10:24:17.9148
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pMayTMvjJmQIDxFKS4Jc01IzLjiLbyVCA9hTrqN3WtY70ukJIlGmIuCQ9YdZVdftaI3rDut5Pi+ZkerUcvgKwGgdNgIhOliHLp2DiZzCDwc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7595
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 30 Jul 2026 10:24:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10195

Hi Antonin,

On 7/29/26 12:02 PM, Antonin Godard via lists.yoctoproject.org wrote:
> Link to the definition of a sysroot (from our glossary) when it is first
> introduced and later in the "Sysroots" section.
> 
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
>   documentation/sdk-manual/intro.rst | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/documentation/sdk-manual/intro.rst b/documentation/sdk-manual/intro.rst
> index 3e78219fc..53246bd9a 100644
> --- a/documentation/sdk-manual/intro.rst
> +++ b/documentation/sdk-manual/intro.rst
> @@ -45,7 +45,7 @@ environment script and contained in variables such as
>   :term:`CC` and
>   :term:`LD`. This reduces the space needed
>   for the tools. Understand, however, that every target still needs its own
> -sysroot because those binaries are target-specific.
> +:term:`sysroot` because those binaries are target-specific.
>   

We capitalized the Sysroot term, so maybe have it capitalized here as 
well (I don't think it makes a difference but at least is consistent :) ).

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

