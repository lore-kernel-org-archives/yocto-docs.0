Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FE52CD4F26
	for <webhook@archiver.kernel.org>; Fri, 19 Jun 2026 15:23:36 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.64])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.44992.1781882608409940720
 for <docs@lists.yoctoproject.org>;
 Fri, 19 Jun 2026 08:23:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=VJX9+J3i;
 spf=pass (domain: cherry.de, ip: 52.101.72.64, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LIkAACqLCqE6KnO13Ve4q5cSEaUcdt9c91jMFFQxA59o6E1LAyt4IiKbRvk63GDlEjzQB+qhHqbOMKXU9DpbD9NOp8ZBJkY5baYx0+/Q5sTTlimle+yicAbIvJuUfTtUBQwGK8jW6pS63N73FoZ5lhvw6SpYDmMFWKJpJ5M1+NmrblQxx485/JyYTs53RSttw7yfEYai1YCFL+CqaUlk2P7e0nJRFzdqWr3QHOuFWoavkn4NkzxvjrRY6Brm5AiNrwjtbRo7kHGSjay3zUYmBN+Gz4S3KD6n9q0HA/nDttNgwLSUNIiAtdM3NdEBi4pk6bwJLNDwWoZfdgCAWznh9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0MqO2x30Ge1P2tzEHit6eJLfE7w6npXF8YvTxfewpjc=;
 b=B9eTlytTZFoMBQ9uer+okRky4En15OGbpFYGlqKHa50P7/kk/8wwP+yd0umItO3P5HJYqunER635DBStLLqKntFCSbXcLmFGk+aHzZYYnWUFoMTsT7rYmFLd0iOMdnpXgsXmkZMmfBOdhzJZiWDuFlWtkeAWwSB3GVJ7mlNGo6dvSnbBamsCI89ix493B6oEv7BsFJxU/vdTdV7K6YpFITkiAis5CY0PVvYhse0s56QqVw81ZHV/IVtxFAfIvNMlXr1xL8M/A7rM5dXHnuEpGj5W9Q20q/q5RPJ6UuEAOccNinDDM4BmujSNtNGev0IInlKLvHilnKpC+vRhYl0mSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0MqO2x30Ge1P2tzEHit6eJLfE7w6npXF8YvTxfewpjc=;
 b=VJX9+J3iQYZniZ2Fwhkje+dl4OI1Cr9xWPj7zPrxJCtxz6QJVnPEVsM1vU/mfKEem+lxxUhqb/12agJfrkDkVn+B6w5D0ss48QwpYjBkJZMRKW0zfHWDpiZm1O1NXBRUAKRzBtYLhmdof7Az5/1nG/IeH4++BRKfuHHSV1WMe8I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from PA4PR04MB7743.eurprd04.prod.outlook.com (2603:10a6:102:b8::20)
 by GVXPR04MB12127.eurprd04.prod.outlook.com (2603:10a6:150:313::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Fri, 19 Jun
 2026 15:23:23 +0000
Received: from PA4PR04MB7743.eurprd04.prod.outlook.com
 ([fe80::9a4e:252f:2fd:97b7]) by PA4PR04MB7743.eurprd04.prod.outlook.com
 ([fe80::9a4e:252f:2fd:97b7%6]) with mapi id 15.21.0071.010; Fri, 19 Jun 2026
 15:23:23 +0000
Message-ID: <d052854b-4d69-4685-90ca-6f0e76589261@cherry.de>
Date: Fri, 19 Jun 2026 17:23:22 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH] security-manual: some grammar and wording fixes in
 intro
To: rpjday@crashcourse.ca, YP docs mailing list <docs@lists.yoctoproject.org>
References: <6f15263e-56f3-fe32-ea3c-c81d89f34d05@crashcourse.ca>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <6f15263e-56f3-fe32-ea3c-c81d89f34d05@crashcourse.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0169.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:99::10) To PA4PR04MB7743.eurprd04.prod.outlook.com
 (2603:10a6:102:b8::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB7743:EE_|GVXPR04MB12127:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ee2583a-a2d1-4afc-70ca-08dece16b38a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|366016|23010399003|1800799024|22082099003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: 
	ZK6hX4oyTxQ+911/VtMlHNqLbwiV00NJL3n08mHJuql+PBPRb5Xydohrpimfx495QgFE2pn/hMVMkZnGY2QomLX5BqoMUmVz8PF9falfWvKE57PKOdc+Dr0uNRkMyAoXpAZOGTg+zJxoSMcmg6I8n3axlyC1+Zw1gqdvHyvjDsLqg1nnKJqHxtDwO7uWeCjvMjCE5ed0O3r1I5ucoJEzloWsd9EVQDMf1naOGbTqTAyu6dEPlGYC+KRmKWM7ODJP49gQbGGag/DbrkqO7FOw71OdKu+SCbn2vhyRpg3NYcdBwhJo4vadpHeNQo9B18lHmpYG83vz+VoQhiRl2ae/ZO5+I8orGURttkjMnqJqb8envRl1Yo2pnliVZcHUUt/AOEgdWuFtVCljRJBwvxxB9rxkhAB1SO+FARzWJpkhey/rYBaWDtsWS2iDLtYD67Wjt2qqvjTEzv9kUSiDzItK5ljKJ7tT75mJqpcnTByFVqHu+WhwIFuFzwZlkCOKnqErlb0qUYDxMh7zRcLHFRLqELagelGNGGIYxnoJw4Ae9rwYO8cli+Q5duEyIL0npLz6kV5iO3uFiElvd5Mz6rOoS8f09/x2Ah1/hcVpMvtzdq+iKAyYnbPZnqql1g6LDcg1BSp2dH6mLh8oWTXIdSmT1CoR0rde4Aom1vjs8Br+Eig=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB7743.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(22082099003)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?LzBtTVYzaEZJVytCZCtuL3pNc2FMU1FubXpxR1QzTWQ5aHhMaXVkODAvTG9y?=
 =?utf-8?B?eE9YZzZ1SkJndmwrVzZjV05zMlY4Y01iQUt0MytLcmR2Sm11K0RvZjdxeHRO?=
 =?utf-8?B?czRtOU5oOEFrSmZQRU1tTEcwOGozYTVXNXM1MHB6a3pXclhpa0VKekVIb2VS?=
 =?utf-8?B?Q3B6ZmNoT1UybkJaTTRhTVdvSy9EeFdGZ216UnVUNytyRFYwT1Faa1h3V0l6?=
 =?utf-8?B?VWJXUEVxM3UyNU83NWJxRnhxQTNqV3M4UDV4dTYxdE5UcTFPVDRPM0ZlOVE5?=
 =?utf-8?B?MmV2ck1Yd2xpaVFMTGNVUHFRNU9uRi9IcStGeUxnTHNOeWJUM2hvNUhPRjJR?=
 =?utf-8?B?bjg2QzhEZWtLdDIrYzhDbXdxUzFXSTNtaFVIS0lJUWZKT0tRcHlJL3RrdTND?=
 =?utf-8?B?aDhsVGMyNkZuWS9HRDBmVllJbmZiNExZKzY5YXBOOTQ5OG1TV1RCbWNOSndv?=
 =?utf-8?B?V0UwMDhrVFhzUXg0eUVaaGFhdWVKS0VXZkxSaVF0QmZQb254Vnk1WFZKVHh0?=
 =?utf-8?B?YzVhZzVoY0JOQStuNURtdVV5c0oyZm5vQjZFY2kzOW9haGFMa2tyc0psbm9U?=
 =?utf-8?B?M1lOdVorZnBHR0JpV295amg2SW9QdHJTOXU2c0c5MVFYM2FQSElTUzRYU2lj?=
 =?utf-8?B?cFhicmN3Y0xlbDZtUS9lTHh1dlBobmE0SDVnbEJEY3VjdWQweDJOSVlKYnJ1?=
 =?utf-8?B?N1o4amxtTExiRWs1QzhKeUYyem83bnVEZHFZY1A3akl3MW15TWJuZy9HTjJn?=
 =?utf-8?B?TTgzYW9PS0NuVzEzMERUWFI1MjViUEhqQjhMaTVSRHhNRXNrdm53NHU0MkZ1?=
 =?utf-8?B?cWppRjk3YlhFZnY5RkdXbWVpenU2cHlhUVJQWFVSUHpJNzRCRE1HZEhKc1pK?=
 =?utf-8?B?M3c0d1hiUFpxOEFvZ1grZ0k2YWZGazFGNnFXZEp5bHRFTzVNb1RnenZOMTRT?=
 =?utf-8?B?OTI1Q3R1cTkzSXpmNVJDYWdZTWc3YkMvL1RKay8vM0ViT1N3ODlZNnp2SEpr?=
 =?utf-8?B?KzFaK21FVlViQkdpeUdBZHlMcVNaKzZWamNhSVRhY0ROMnJKd2VFeEw3S1FY?=
 =?utf-8?B?VXRLRHdhWUhMbWpCVjBaR2pRK1RwdGxBSTlyVll1bkxUa2QySkMydnYwKzZG?=
 =?utf-8?B?bmdqdEp3ZmFXMVFFRlQ4aWxCTVFsUVljdEhnc3NlWXJFcno5THhGcTNWOWc4?=
 =?utf-8?B?eWUxTUhWa0FUTnJhSHAvNFc1VFIzMWZLUitrd1JKR1BYUWQvZVRXclhRZll0?=
 =?utf-8?B?ZFo5RThVenhrN05Nbk9qSWlIM216QmFjanRwb1NkamMxZjFsSm56NGNWR1Iy?=
 =?utf-8?B?OXZMUDVXUm1iVTdtelFBL1ZyZDZyd3NCNzh1SU43eTZrQWJtaEZuQlNZTXIw?=
 =?utf-8?B?ZkJxZWxvTlVyeHd5RG9GaGRWRzZrY0ZBeFhWU1VjQUFBcHJIR2JrbTlUbFAv?=
 =?utf-8?B?NlZaejlwM21PcVhyWlFkQVNhd0gwUFdZUjNJd3o2eVJYL0tIRzNUUXVyeHhV?=
 =?utf-8?B?dmUzdWdsNHdYcnp4ZHFpU0VML3RaL2Yxb3FmUERNM2ovRFdXUittaXVLZm5M?=
 =?utf-8?B?UjFXWGhGdmRZZFBodUlJSzI3TWxzZ3RaWDg1VHVHTzl2by9CMnZsZ2lkSHE1?=
 =?utf-8?B?Nkc5MEpKR09rVHovSzB2NnQ3aHZGODNKRlFRK0dWZmtNcjN5c3FRdS96akEr?=
 =?utf-8?B?Y2pKUDk5V2hkZUFMa0c5N1h6RlprSzc0a1JSUm9WUU5PSXBCZWJMS25pa1Vx?=
 =?utf-8?B?RkFZa3lQbStWY29CbnNQK1VtTkZhdWdDTXl0L29tU0RDWGI1c3htczV4KzNo?=
 =?utf-8?B?VEFkcllmaEkxTGpRT0xQZ2k2MHppbGNhSnVZYU9pOEw4WTFpa0FmamJnWG1Z?=
 =?utf-8?B?TnE0ME80Ujl1a1k2R2JqZy9FSmh5QXVscTBhakxuV3BqQ2lxK3phZFI2Smpx?=
 =?utf-8?B?Vm5udjhIT09YekYvVUpuSVBQbTlkNDhCOGpvWGp5UUEva0tOeElUdml3dXQx?=
 =?utf-8?B?TXFoVmRXbythYlNJdTRQcW85Um44SEo4M2tzaW9ONGRWM01XMzZtU0ViVFdL?=
 =?utf-8?B?MDRYQnVBUmc1cTdBaWEwdGJBKzhsVXZxcCs1UE9UdW0wcXFKRGpIQ2RSY2Jh?=
 =?utf-8?B?YTg2VTM1SUIxcm8wMFU3SXI2VE8veFlqcGs4NVRyNHVUWnFxOG1FNFBHVGJG?=
 =?utf-8?B?Y1BPcktxeUFqVUl5NHErbmVzc3NlWkY5YUNpclM3dUcxZit5VGtFV0wwcXF3?=
 =?utf-8?B?cUV1aFJ1eUlJd0swUjFpY2tXc295K0RpdVUxVDVmSGpRd1pUTWYzSGhHN3Jy?=
 =?utf-8?B?L1lPNDRZM0lUUzRBWlhySXVOMVlsQSsxY21oTlZzeDR2OUFxRzVRZz09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ee2583a-a2d1-4afc-70ca-08dece16b38a
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB7743.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2026 15:23:23.3886
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DZS4bwZfRnyWUrWoEw0QDVZK+llytbX7hj9TAiJgRi4ZddlNIkf9GxcqGu+pnLUvG2f1gyrPpg0N2nmUtSEC7vUhLspApas/I/E+qRMIN8k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB12127
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 19 Jun 2026 15:23:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9799

Hi Robert,

On 6/13/26 9:24 PM, Robert P. J. Day via lists.yoctoproject.org wrote:
> 
> Tweaks:
> 
>    - grammar
>    - punctuation
>    - delete word "necessary" as that is too strong a word and implies
>      that what is being discussed is mandatory when it isn't
> 

Please be mindful about the added comma or similarly opinionated and 
tiny changes, I don't believe it brings much and I don't think it's 
worth the churn for maintainers or reviewers.

That said,

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

