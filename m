Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10FDED0C854
	for <webhook@archiver.kernel.org>; Tue, 13 Jan 2026 11:12:52 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.29])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.56508.1768302765782761586
 for <docs@lists.yoctoproject.org>;
 Tue, 13 Jan 2026 03:12:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=FoY6ak+B;
 spf=pass (domain: cherry.de, ip: 52.101.65.29, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TYqcw05W+fVuLQXHx2lZ9xeJ3/KzuJqLMSW9r0B3pRfnPRtBTHki+lOeblM6Qw6p1qDPpr0uiZCFbo83t0pssrGbrvQZ9AoVqWDm/nOjEkrGmYpe5QqDLBW77Ne+eNCsBIZon6S6lcp8d7vQpjFD9aLObVCwXL+hi/Lmd1ZPmIQxElPXBBiI6ZcclfFjILVebDefH2t6bK5a2DgKns6jI+39Ji6LPMKf97Ajgjpj0Akf8ouB/lVBMQM09DYtraR6w6HwNZQlRe1PdVEjBmKORqPnMyxkwc6JmP+mj4PbDqlherjENLjcsKijsWdgFrV4xWAcgIcyKxoYHbrTBSyZ+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dVcQp4Y5hHE3eR/LRVwG0nQ26EB28z1lvxOkvSdSeQA=;
 b=MWUutANTOxraKnF72KSKVghF6pv1576L5wTrlbYhk/efKctwCBbMsFynQq8wfvWNmmYqAUTCIuaTjTi5+sM8XX0VSANF2mJuEl9Kt4rQ0G/boixY9yVQgFZI1sIN8rUrPxjC5/jE7ZLpDP0TbZUBM3UXbdeIcha07B95gDr8wEp+jcAaGFzOWzh0KIayFh+Wt9Ak5OBZXA+PFF+Z9WQNNG80b7OBtNbOcTmkEph/qlz2wq6CCqr0cJO9sU/eD/wPpqzUhbIE7i8EWVvf8JUEfSqWaC6nRmhAdPmrP/BfUQkyRADZALXEp8e367T7sy/7fs4rsv8dCsnCaQEkSjCyOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dVcQp4Y5hHE3eR/LRVwG0nQ26EB28z1lvxOkvSdSeQA=;
 b=FoY6ak+BOruOpBVpF6501jFEouu/AUGHMKTJn7ny6aXXiU52piXJcnENV2gA9JWGuKcFoX7gfpLz9oClUtrqCpUnASB/g+Qgd/8tMCGpSOTYsVvpKc5J+lS0vueOT8xFrD/VJiyID3SXZnyWzy4AB6lZCAKLaf+t+FhFa/lRI6A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by GVXPR04MB9850.eurprd04.prod.outlook.com (2603:10a6:150:11a::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Tue, 13 Jan
 2026 11:12:40 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad%4]) with mapi id 15.20.9499.005; Tue, 13 Jan 2026
 11:12:40 +0000
Message-ID: <880b6131-aaa8-45e5-9730-eb145d5c1ad6@cherry.de>
Date: Tue, 13 Jan 2026 12:12:37 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH 05/53] kernel-dev/advanced.rst: remove obsolete
 poky repo references
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20251224-remove-poky-references-v1-0-658a5f4dbde2@bootlin.com>
 <20251224-remove-poky-references-v1-5-658a5f4dbde2@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20251224-remove-poky-references-v1-5-658a5f4dbde2@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0147.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:96::11) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|GVXPR04MB9850:EE_
X-MS-Office365-Filtering-Correlation-Id: 35f6bdd2-667c-4d03-6234-08de5294aa98
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?TFFOaTM0RlE4STlhRzdXampIam44UjVHRUVjS1JTbWZKMHdTNjIxMzd4VzJS?=
 =?utf-8?B?dFIxekVXNU9PNlcxM1BHckVXNUVWakNSTVdnRjgyUVBPY2RtVzd3Nk1pOVhW?=
 =?utf-8?B?eFZpWTIyUHE1RDdvRTM5RC83OHRBS3M5WkVZTEoxSDd4TEVKUVhJMnZsT2VX?=
 =?utf-8?B?UGZ2QzFDaUdWY1p0bkFtRUF4aGNWa3gycFcvNlJ0N3pLVjdLTHV2SVlrenlN?=
 =?utf-8?B?ZjhyNDhzSHp6RXRiZ3RTRm4yMkFubEVsTzRWSkFYQUQ2cEd3NkRyaWpsam5R?=
 =?utf-8?B?dWlrck42a2d0UUhuQVRCVFpKb1NtRGVXVTlKZDNNRkFlTUhXN0xyWTFzOFFV?=
 =?utf-8?B?L3hPNkh0REJpMXZiVDJ3RE9ZNHI4aEU4RHVrMmx0aDFRZmwzTldDRHd5eUV3?=
 =?utf-8?B?MzVIdTJsdXk0M0RaN2N1NjViOW5JbTg5bW9iUXc0T1Q4c3R2dnFlMjV0NzRa?=
 =?utf-8?B?bjhpblVDdnJZQUZySDBQQkQrMEVvZFhZSkFRMzFtSnlsMy81OWg0a04wWThx?=
 =?utf-8?B?Nm05RVN3TjMwMW1CNXVnblBkZWhNTWZiQXc2SmY4TUlBQXdJVXE4d2xJVjMr?=
 =?utf-8?B?T3M2b3JRZnBKWm9WVTh1L3lkeUJpRFZ2eG9icDRZdUN6ZHRDZmpjVThsUGxs?=
 =?utf-8?B?Z0JMekowQjBwRDVuMG4xSnE0bVptYkJTcHhZbkFSYzhIYU1IcENJOWU3LzhP?=
 =?utf-8?B?NjRWQWpKVldTN1RDaUFZWU9hd2d1RS9hVFZUMktqVS9saWZhRnJnbnBYOURm?=
 =?utf-8?B?ci83QnBVTEM2NmYzc3BzVEU2UU1mMDdVRHVlS1NqRkZWVWJ5YjBDUHByaU5v?=
 =?utf-8?B?OXJnbHBVTG5QMXJzM0Vwd3JaaDBBcVBUaE9Wdm92dVpnYk53cStwWDNSSlda?=
 =?utf-8?B?Vy9MNDQxdERiVWFVaTdUSnVQdkZGMlphT0hDVC9ERWhOeW4rbGxqMi9TMklV?=
 =?utf-8?B?TG9iZGFCbzQ2c205Mkk3NTdjczMrZHltTW9aemdZTFQwUWt4SGNTaU5BR1lp?=
 =?utf-8?B?c3ZpL0h5MlMvVnZHdUJoamhFYzEvZXYvbzFsYjJJUUJmTE1WN21Fc21EaSs0?=
 =?utf-8?B?RGgyTGhod1lHbVUrQVc3YWRzV091TGxpT0loVndwOTNRZVl2MkhBTS91STVU?=
 =?utf-8?B?QThtdm5OK1ZYNGMvaHhsVENtY09hZURUTDloc0hTeFUzdEVqYzlSL1A1MHRs?=
 =?utf-8?B?ZEZJa3h0N004UjAwdW1IOG5LTGFMcUpweFllYktWZnlXM0ZQMmNNeGZkUFB1?=
 =?utf-8?B?WTRDcWE3YVE3VjdjZkNrT2NKNENrWUloaEZDNTVKa2g4QWJPUjl2blpIRzZx?=
 =?utf-8?B?VU1TV1hXVk1BZE4vOE9SazVnU3YvQjduZkF1d251WFlHUU5nQkptL3ljWTBK?=
 =?utf-8?B?VzVjRm5IY04ydlplNnhlWWl2TThJQko5U2QraGFBV1lVM2VrbktJdnNCU2lD?=
 =?utf-8?B?bnR6ekZ1QmU4SmlCeWZLanZsTXlMVVRUVzF5ZzRFR2hZZU5wbEMzbDJUR0d1?=
 =?utf-8?B?QWtyU1d1RytDZEZaVXdFamRzVmNsKy9saWhCQUZxYnQ1MzYrbUFRcjg0bjFH?=
 =?utf-8?B?eGk1TUVuTTAwSkowM0hTS0dqQW0zK0ZDd1pNQUlEVng2T3Z4VjBDcGY1TkVJ?=
 =?utf-8?B?Y3laQzlBWHJHWEp3YXhTTEdiOGEvQUFyWHJRUlhvVnBVdEVZL2NaSmtFUG9j?=
 =?utf-8?B?dlRCVm5aWWdOWFI4OFgvKzdqWVZUN0pSRWFySVRNRXhjSXEzek9sTEFhY0wy?=
 =?utf-8?B?RVRuT3FxMG8rQWJFOTUwRVZzb1NBSndRTzdDVzd3cFhrRkRuOXZrUmYxRVV1?=
 =?utf-8?B?YnB1d1NoRXdZRGtyMEgzREdmZzkrZkJMZS9DV2diZ2FhbHNiS0tEcm5tbTZV?=
 =?utf-8?B?OStYU1VXNlFVOGZ3NnpaZmxsQitEeWNQN1ZWZkZ4WUN2dHZMRkJzRGs2NERD?=
 =?utf-8?Q?CVAtkSr4ETIYB0uLJlqGlVRrthEs2mNp?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?d3lON0ltbHBCQ1NDMDVyODNkNjdpYXdMckJQVEozaWhUaTVaVDRUcXlwUjg4?=
 =?utf-8?B?L2Z4SzZpWWdOSGpKaWxadkFFMDRkeUhBY0lGbmZuS0dYZTVza3BCMHMxUUVR?=
 =?utf-8?B?L0RoMVVSYlFsbWs2d242Qkw4MWQrUFd5OFFxbmxycEFZbmx0TTZtQlNLMWVP?=
 =?utf-8?B?djl6TDAvS0pxUy9DdlRkOVVUdXlmZmdzTnhYclBqNm95RjQ1YWVJV2J1c1hD?=
 =?utf-8?B?L2MvYTJadDlIYnFNR3dqalVuRHFpUEx2SXhGL2lGeFBxenZBejJyN0pjQWF3?=
 =?utf-8?B?VXJHMU1WQVZraVl3KzUyVTdtd0ZDVTN6bTZ6WUt3Umh2NitCM3NQV0hZN29L?=
 =?utf-8?B?ZmkwMmFQWHNFSlJzbmFuamM3NXRhT2hiMEptMDhIRXVlZGRYOHZwTW5NVWtR?=
 =?utf-8?B?VjUzTTUvWU5Va0EwNXh4SStFa3lPMks4aW5IL2ZnTzBmVWtlWnJPOGoyWS83?=
 =?utf-8?B?YytGd3NBZXRzMlJ4ajVJdlpkYzZNRUtxejhnOXdHZGpsenJ6cEtrUFRYV256?=
 =?utf-8?B?RGJzS2RMbklnK3cvM05BTjdMRW5mNm5BRXJmSXdhS2VxOUJJZi9qOStDR2hL?=
 =?utf-8?B?V25mRDlpVWwvNXVJQU9OaW1VZ0hhRC9sVEFCODk2cFZTTWo3d1ZCTGl1dGJS?=
 =?utf-8?B?TTRkbDhnMjNqTURRck13djZqMmdGaFJkR3hsUklJWkRlUHM1d21PVkNDcDJh?=
 =?utf-8?B?VVFhNmI1UXpKNlA0Um5kSDB0Mm9kcEozYnRUTUhwUENJWlZIM0xNRzBBQURk?=
 =?utf-8?B?dHBXbXllQWZMNFRCZVFxRjI1ZS9hQXZyWGpsQlNqQUhXY2tZUWorL0R0UVpJ?=
 =?utf-8?B?VDZGelRwNEI3cE4xRVkxZmpWNm9VVWJxQWlWdHJmZUI1Z0ZlVkNtQmg0bW5y?=
 =?utf-8?B?S0dLZWgxdFhaTjZGb2szaHNqY0piTktpWS9CZGhWc2pDdGt2MDNXL05RWHdS?=
 =?utf-8?B?Y2MwY3NRSmRPeWc5VkxKRjQ3RStGS1UzemJhMEN5MVdtNk5veVQ2d0V4ZnRI?=
 =?utf-8?B?SDNHZ2JUa3FJUi9JNzh3bEhoZFcxSTZDcTBPa2ViT0VLZDFmRm8yTTFpNCsr?=
 =?utf-8?B?a2VDZzJ6WVloVEZxZ2hTbFI2Q2VRR3Z3TUtoTVpzVmdMa29QWE10bEFUcW9i?=
 =?utf-8?B?NDdVdnQ3V0kzSlhwbW5pWGs5MXVHYUdGUS83MHpWd28yd3pOTHd6M0M5eFdM?=
 =?utf-8?B?anZnbWtCdjNMK1JGOFNLdktMcDE1S2t0bzhPNDNTTnpmdHNBb2tRNHJmcWxJ?=
 =?utf-8?B?YU9naW1jdXo1MTRjSjIyVmtWTm9CazBRcmF3TE1zKzRmeVVQWUIyWVBnWkQ4?=
 =?utf-8?B?MGZCRWVhN2RHMktibmtwd2FTT3hHY3JVSFJtZnN2RFRRUzZnaExYRXRhTjM4?=
 =?utf-8?B?b3Y0NUUzZGMwNHFGOUQ1elFpR25Fbm82K2ZDNStML1BkNzlNWExsNTJSRmZu?=
 =?utf-8?B?NEhBWW1WTCtFT0pYOEJwdThUVkFqL2tubmlvVGtnTHFLQXVaQWFhTUF6WmQv?=
 =?utf-8?B?MzVZYjNlNDNISCszRlNhOXhDaC9kNE44Y0VQcTNadnpTajlQSHpmbWFkTlE1?=
 =?utf-8?B?UlV3aDRheUNzNTNzN1dwZW9SeGMxMDloMnhOSzBJQmlsanZ1Vmd3ZFRiUFdG?=
 =?utf-8?B?TzdTcFZ5aDl3Tnc5U2phSVc1TEltT3JRQ0tBQ1dlM0E3bi9ITHlRVEdSQita?=
 =?utf-8?B?VWg4cVdSVndhQ0tLNlAxWkJ2THcvdldyY3VvOHZZRmw4Z2hQa2JJRTBvT01a?=
 =?utf-8?B?SGtVNFhaY2VqZ01tREtHdmVmTkpoMnBxc1I5cXd4ZUIzV3lrU0VVK3JSVUhH?=
 =?utf-8?B?N2lZZXB3UUx3bkJrM0tyVmFqY1QxTFRmYXJqWVhXbjM5UnU4RTVDTzE4L0No?=
 =?utf-8?B?V3FXTVQ5a0JpanB2V2V2c2tKMlY0Y25KSTJVclNzZDcrb0JPaXNYeEFzamxi?=
 =?utf-8?B?RVFiOVY2Z2ZPOTI1dmFtUXp3SDBOMUFla0hUcmc0ZjJPZmpCUFV0UnN4S2N6?=
 =?utf-8?B?bUxKb1BrR01vZy9XTlBOYU1QNTRqMmZWOHlmYXhuUEZ0UjZFZjFXTkFwWE1y?=
 =?utf-8?B?TGp2SWhReTM5cFRmTUIwWk9SRUJNZ3ZLZW9tSS9FL05PQ05IUCtyWC8vNU5X?=
 =?utf-8?B?a3puVEFMTFhHN0xjNmEyUGhCVCs3cllqaVkzVU9OYjFRN0J6bFRGdGFJVmZY?=
 =?utf-8?B?alhWdWgxcUNwVFdRZ1Z1aFM1TXBvVmNja0Vodit6RFpjUWk4TEJqZlFhdXB3?=
 =?utf-8?B?Rm1uZVA4VmZzd1VrUG1NVXZZelFndG40U3BqWXFwWjR6aHM0aS9xcXlURHd4?=
 =?utf-8?B?TTVtbkdTeUhwWWluTGlqUnZMejdZeHhHUG9uS01ZVFliZEZKMzVhQT09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 35f6bdd2-667c-4d03-6234-08de5294aa98
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 11:12:40.4859
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nx3pHa99GGe52t16voyI1znPOWcpwcNZxZmoYBEtpfN29wRCFhSj83EWcrHjl+KbUE8PuO42qVDn1D6YE4ByDOaxWMlePwyja8kM6qfjGxA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB9850
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 13 Jan 2026 11:12:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8485

Hi Antonin,

On 12/24/25 5:31 PM, Antonin Godard via lists.yoctoproject.org wrote:
> Remove references to the Poky repository, replace by OpenEmbedded-Core
> in most cases, and refer to bitbake-setup or the manual setup in the
> intro.
> 
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
>   documentation/kernel-dev/advanced.rst | 12 +++++-------
>   1 file changed, 5 insertions(+), 7 deletions(-)
> 
> diff --git a/documentation/kernel-dev/advanced.rst b/documentation/kernel-dev/advanced.rst
> index 4c463503f6..97cb663222 100644
> --- a/documentation/kernel-dev/advanced.rst
> +++ b/documentation/kernel-dev/advanced.rst
> @@ -24,9 +24,8 @@ grouped under the "Yocto Linux Kernel" heading in the
>   Kernel development tools ("kern-tools") are also available in the Yocto Project
>   Source Repositories under the "Yocto Linux Kernel" heading in the
>   ``yocto-kernel-tools`` Git repository. The recipe that builds these
> -tools is ``meta/recipes-kernel/kern-tools/kern-tools-native_git.bb`` in
> -the :term:`Source Directory` (e.g.
> -``poky``).
> +tools is ``recipes-kernel/kern-tools/kern-tools-native_git.bb`` in
> +:term:`OpenEmbedded-Core (OE-Core)`.
>   
>   Using Kernel Metadata in a Recipe
>   =================================
> @@ -357,9 +356,9 @@ kernel of a specific type (e.g. a real-time kernel). Syntactically, kernel
>   types are no different than features as described in the
>   ":ref:`kernel-dev/advanced:features`" section. The :term:`LINUX_KERNEL_TYPE`
>   variable in the kernel recipe selects the kernel type. For example, in the
> -``linux-yocto_4.12.bb`` kernel recipe found in ``poky/meta/recipes-kernel/linux``, a
> +``linux-yocto_4.12.bb`` kernel recipe found in ``meta/recipes-kernel/linux``, a

Maybe we can also think about update the recipe filename since it 
doesn't exist anymore :)

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks,
Quentin

