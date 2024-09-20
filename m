Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B89EC7882D
	for <webhook@archiver.kernel.org>; Fri, 20 Sep 2024 11:54:29 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.67.48])
 by mx.groups.io with SMTP id smtpd.web10.16405.1726833258451245090
 for <docs@lists.yoctoproject.org>;
 Fri, 20 Sep 2024 04:54:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=dDutzTOs;
 spf=pass (domain: cherry.de, ip: 52.101.67.48, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yk72q//KjBwUVb9y0d5lbe9LtjHxJJDYVBPolDx23Xj417WqUZPjnajCSXtKS6Oy8Jg8y/+RmRpcdoK2P/f2GFCW4tNPyjfa5UP3jwXbh5UsR3kwqMMI6uBr27gTpFBzND0Eojpzw8eelpjBkpPBntWbuz5qILzj5N8oVkkU9qH2uepeFYd5ZTRnyuVE3gm1nzBapP1t3RkoLZoJZcai8U8cGAfp7hMenJSiB06GJLBGoKfXIKQVEEvmICSlsSO/6toLDgiqwXdeLXbH4VIrt5MH0NfgEb56l0RxTzH40NC4EZaLu/Dr/PJpnLAbamMZjmBEzK3gJAOQCpFIoNgkdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WwvyfCUMfXMaw33nDhYUoBpCMCwUh27zk65wZ4DRcwo=;
 b=C7Q9csT0FrFSkF3hVdEG+y/nQmzGgY3Gs0/oXt29TlzF8LIQkZ4DgoxCDSFOUgQUVyztxC3enVnQ7+MDuzdL/AnXjLgd0jmurhKiCW4hP10UazvVFhaZEJ933vwYRWcfWmc5tUNYLbwycQrW/d0vpxkht6K7GB0pDjI9HwHzBpYNZ5VNcClkYgoRffPyABQcne4WHVcmkUN0wWxXwNPePNvvhGap1TOInPaYBCpKUNmRpTAolyKkVdYkjmkauHxjtCOJcC+wA7fvz686xCw+ScWO8L47fOuSyxMmd2X1Ufk2GvQId42nYAioRsYZOXyyhJ8FNmI+N7LTY5jhsqGqHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WwvyfCUMfXMaw33nDhYUoBpCMCwUh27zk65wZ4DRcwo=;
 b=dDutzTOsVadejHcufyNy7uobcpEZlT0b9pnRnsxx4RI4q52RM+CNBr9aeacsr9qFZkKVT7drD5lxeycshDOIxgxr9GvO+pC724mPRGAmmMhusqagF2L5LGB0Xqp8zBJLcT8yHbJ7AoKNIm3r7Zo2IYBdOUkUCu0fkO6d4lrRFn8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by GVXPR04MB9831.eurprd04.prod.outlook.com (2603:10a6:150:11c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.16; Fri, 20 Sep
 2024 11:54:11 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%5]) with mapi id 15.20.7918.024; Fri, 20 Sep 2024
 11:54:11 +0000
Message-ID: <9b1f5e0b-5af4-42d0-acef-cce0f3424f43@cherry.de>
Date: Fri, 20 Sep 2024 13:54:11 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH 1/1] bitbake: doc: suffix for BBFILE_PRIORITY
To: simon.eu@gmail.com, docs@lists.yoctoproject.org
References: <20240920113819.2845816-1-simon.eu@gmail.com>
 <20240920113819.2845816-2-simon.eu@gmail.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20240920113819.2845816-2-simon.eu@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR5P281CA0031.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f3::7) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|GVXPR04MB9831:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e60c8c1-3beb-4d47-e31d-08dcd96af134
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?TDU5YWxRSGFHbWFTRllaeWlocUcxb2dwTGJqN0VYOHF2NW16d3ByU1AxMGlO?=
 =?utf-8?B?T3NBMzMzVDNweUYwdVR4NTA1QzJTcExkOCtWZjdCNk1DNUVGWGw1dXc4eXkw?=
 =?utf-8?B?YnhKSjhjMllvSXU4Y0REWC96Q3VyUHZwTEpTNGJ3UW5HT2g2RWVkcWRSdVd4?=
 =?utf-8?B?RFA3K2g3eUw5NksxQ3RJNHVWQ2lvUFV5SXREeVVkTi8yenlaUExKSUJYUExk?=
 =?utf-8?B?T0J2Z0FpYmhzUnVLQ1F1R1pmSlM1V055S2VTZ3Y2MU9MU3pBKy9SVFJEdnI2?=
 =?utf-8?B?cjMrNW5RQ3NUbU85VGk0RFYzQkgwbXREeFRJbUNId211ZVhaT1VQVkdPOERn?=
 =?utf-8?B?WHZmYmY4cnAxa1h4NE9EU1FLOU5VMWRBRjRRc2txcG85N2RCU2VreFFEaFkw?=
 =?utf-8?B?QkVsSTR5RjJqWHZoZndFL3A3a0t3cFV2VGdGRkJhY3Bua3l3dHF1eVIyQWZs?=
 =?utf-8?B?eno2U1hZbkVJZmVjbkw1Qiswd3plT09NWi9FVVI0RG9ZSXdUeUZkSkVMRk1Z?=
 =?utf-8?B?amRsdFUzUVBRSDhrQlRocnRncTU3MytwL1hFTXFXbFhubHJIbXhReVRuWVI5?=
 =?utf-8?B?eWRpMlp3MFFNa3lSK3VDNVI2RFJwTkI4TVRIQXNvMWdNQWxOL1FHNDZpR2dM?=
 =?utf-8?B?dnVzQitxb1lQWmxlRU1mRzRMU3Y1YTNrbGZPeEFlTlZwcXlyaElLQUlWUjZx?=
 =?utf-8?B?NExYQXFqSndTbEFRTEs5VEpVcXA2VWVOcGVYd0VJeVhvc3NPSzBFdWVWc3pD?=
 =?utf-8?B?enNHS1RKVmpGdTAyaXhtQ2lYdGxBUTdJc2g3QU54Vk15aFhNSHdyTEZDZk5t?=
 =?utf-8?B?SnJtZFk4YjZRMlZkOUlLUGlZbUJmVis4SjBiTVFkZDlEeksvVElHb3VQQWR0?=
 =?utf-8?B?a2lKZzBiNlhFRC9ZRjRQZUJ5TWZwVWtONm5NaXRiNVkvcmo4SFNYeStaZ3JV?=
 =?utf-8?B?TlBtRERoUytCOGFyVzdQcDBGaklRY0hhbnJKSWhPWVZkcDZiREttRWxSNUdQ?=
 =?utf-8?B?OTV0T0E4V0NMWTJDeDd4YkVlZWtRai9FeWYzYUduTUUzV29wNXZocmI3cWMw?=
 =?utf-8?B?cFp2OE9IMTFHb2JOV2lVWEh3SEc4Q0lTb1poeVlsRlpoakprK0RVTkVvRWw0?=
 =?utf-8?B?bEh3eFVDV1VYMU44WDhSOURSU0FlMFljODRxb2R4VlhOem1TdFF0N3gzUzkw?=
 =?utf-8?B?WG9MMUJpMTE3eUJha2V5bk82N01BeGRYTHZRSERKM3NkT2pOL3hNRGJ4Z05K?=
 =?utf-8?B?azdmMVR3ZVVnMGtZZ1lPMzRPUGpUc2Z0TVBpQ1B6WVVGRzJtakJvcTBsUTR1?=
 =?utf-8?B?cVZUUmhvbExRVWtaK3JEaXRhemlOZVRLTkVaUHo4ZXJMaFhGMjdrWFVwSG1K?=
 =?utf-8?B?am1IV3hDWmg0Y1RuZllFVjZwTWVCVmt6OFVXYzQ4ZWhQVEN5S3doc1BvOXk1?=
 =?utf-8?B?NnIxRE1SSG9vK0xtUGtVSHdpWDNyU2hKTm12cEZKcXBnR2J6K1c4S2h0OFpv?=
 =?utf-8?B?YkZCSzBuQlZVajhDTVhrdW9nUGJ5S01WaTVISENnWUNuSm9BMGtHTjBhNzN1?=
 =?utf-8?B?TUxDWnBnR1JHdGkyQmlDSmNCOE5kQVhWQjFweUFpZXVNTmtDZ25BazFwMnBn?=
 =?utf-8?B?d0l5aVhvZk9XSGFYS1M2ajVHQkdwZEY0ZVBuRWFYSmd5a2g2QVFqQ25HR1pw?=
 =?utf-8?B?d1ZjQVh0Zk9BRFlnQi8rSUJEM0J6ZU1hMVcvSjd0WUh4Si9KNmtuY2UzQlJZ?=
 =?utf-8?Q?8aPwQeyHWBEY1rLNbg=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ZWc1cjlXK2U3QjhhUUFwMXBDWjJSWkpUSUVQWlFGQkxHcVQxdzlwbTMzWE8r?=
 =?utf-8?B?S0pnY2NIKzEyY3lrLzE1Y0Zmd3hhRkQxamtxWDlOZDJzekZjdmFNazYvRFhl?=
 =?utf-8?B?c21wQVJzUkxTTkJpckxGQk1ycnJIZk5FNVAyTlRnMnByUWtFdnBBNWIzUXk1?=
 =?utf-8?B?UFhGelFCeU1ZUlphYUlwTVp4alRrTlNBUzZQZ2hjKzhNOGNHZDIyWU5FWHkv?=
 =?utf-8?B?djRWdnM1YytvYjNPSnB5T3JzKzF2WUp2d0NLREZ0UE02Z0xEaENYdGo4Qk5H?=
 =?utf-8?B?NG1BZFRNMHJDYWt0eEJ2YUtMNkRrOHVHRGtuT0dzbndwZjNkZ3VuenhudTRG?=
 =?utf-8?B?TkpHbzdCZWtheXZQV1JnNy9jMFkzWW5EK2w3UHZ5TU1ybGU0bTU0UWswSG9m?=
 =?utf-8?B?MGYrblZHWk53aCtCQ1VaUEJkNnk0WTZIRUhzL004MWNCWmxOcDMxQ1BQeU1i?=
 =?utf-8?B?UHU5Q2xpNCt0WEl2ZXd4ZkFmZTRUTDE0b3FmZXZ5SlB1dVp4ZjFWU2Mzb05Q?=
 =?utf-8?B?SUN3U1pmV1VRaGZZSzhFcEtzZFdXRk5nRGxaMUFRdjJZOFRmbTJkL3ZEbU5D?=
 =?utf-8?B?ZHlzdEIvZUJvcjcxVllmUFdWTjE4NW5QQllqRjlUUFlodHZvSzZ3dlpuTU40?=
 =?utf-8?B?cC80enMrd291NU1SaER4ajluNzlHRzhRdkE3d3RpUkN5N2VIOW1LUCt5cGQr?=
 =?utf-8?B?OEFiVUJOT0V5Y3BxN1h3cW5mMEp2K2UreVJZeG5vd00vNGU2OHhMNXlQNmlX?=
 =?utf-8?B?NmVBY291aVZDR3BZdmdqdElWRUJlL0RmNDFiU2tlbmFLZm1NSzBFUWdyTUJz?=
 =?utf-8?B?S2Z4RnFwSk9VMUE3QkFJZHBndXRpLzVEYk1reUltNGNycVJGT2pWazhHcmpI?=
 =?utf-8?B?Y1VMd1ZsbFJVeDZQd3NJb0syeFNJV1dxdWRqVnhQL0lXZ3RINHZSSVpGUWY3?=
 =?utf-8?B?elZ1eTJjS0x1azl2dWVyT3lqRGRMc285OW9sbnpxd2g3eWNXNWt1QnBSTUlC?=
 =?utf-8?B?V1BmbkVKa3BHNng5V0RVOVVobFQ0SkVnTzJBdnJkUndwdG9RZ3IzSzhBNUtQ?=
 =?utf-8?B?T2pPM1lYUDhVaFB5OHI0MnBjRmtrTmtrQ2FUZjBCbzNWVlkwaU45ZVYwWk1F?=
 =?utf-8?B?STNqcFZDK1FIMmZ3b2oxNmt2MFpMeEFXWldJa1NCMlZXbmt3TE82VmU4WlZo?=
 =?utf-8?B?Y2x1UVZTNWZ6dWgrdm5BREl6eTFFUktPajdLTWlBbEl2Q3Z1Yk43bUwyWGVu?=
 =?utf-8?B?UG5oYmpmajduc0lNTDM3VzRDNFVYNC9iVHJmTkNTVnE0dEFkdkh2RkpKTVZT?=
 =?utf-8?B?bG83REJiTlgrOHlVbDBkNm03VFVaRVpIUmRUWEdNUGxVRHhRUU0zNjJ2MGJY?=
 =?utf-8?B?dGE4QmNrQmw3RkhwRXNQWmJSZ0JIblBqeHFOTFkzRTZHYnNNL3VzUnMzWlN0?=
 =?utf-8?B?ZnhTLzJRdGlpU2VEZTF4VDEyMVpTM2YzSmlZNDNXRm9SRjhrdVRuSytMUkJh?=
 =?utf-8?B?azk0ZWgyUkRrbnFBdm9OYUoxWW1LN1BvRmJ3d0dPaXk0Ti9Gb0p4NFBaVWtL?=
 =?utf-8?B?dzg3MlhHNjVYTDUwZ2RwS0Rsa014TXl5S0hCR1MxS1pwdkZFaG5KN2N2c09x?=
 =?utf-8?B?clZpVlU3bUlhRkpPYzZSeERCRlJqTDFlSkUrQUdTOEdqOGxuUmdJNDZYM2dT?=
 =?utf-8?B?UnlWME5NVmdrUzFPeEIwMlFOclhwS3BhcW5zMmEzN3owNnF6Zm9INnVHYW9U?=
 =?utf-8?B?ZVRBWUdwdEZ5VDJUczErM1JabXVlYXdvUnFtcFZjd3FTWDgvMEZaQlRpY3Zo?=
 =?utf-8?B?eGxrKzNFYWF6ZzNPM1pod0F1N0w3OEF3RUxxZzJ3T0Z3czZubzREMkpoN2hW?=
 =?utf-8?B?WEFXekhscEtpYzR4bm1Da0JkazFlNXd2OU83cExlS04wQ3Q4N1FCODc0d2JZ?=
 =?utf-8?B?U0t0TGdkYVllMFBrazMvV0lac1ZNbDhOdHNpQ1owNmRlZXEyTlBrUnBFK2I5?=
 =?utf-8?B?bk85dXZTbDk0UHZ6Q0VZUllsRkg5eE96cHYrd0JzSjlPaE9BZTFFNndCYjRG?=
 =?utf-8?B?TkgyNlY1Z20vVXpTdWNZd2xwUzlpRTlTQzliUkZMamx1VDFsS1d1MW0wK1or?=
 =?utf-8?Q?N7xTex4kkCHbqHSiozxgxb9v8?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e60c8c1-3beb-4d47-e31d-08dcd96af134
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2024 11:54:11.7317
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rpYQlosyZSOXeA+6RfC2f0d01ZZREZONp2GpWhMtxkMo7gdgcCW4isAYt2PLC5VOS7dwmenBLNf1y3JXH9RvdO4k52s2tLqo5KDW/EbB3i0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB9831
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 20 Sep 2024 11:54:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5360

Hi Simon,

The patch should have been sent to bitbake-devel mailing list as well 
since it'll be the responsibility of those maintainers and not 
yocto-docs' maintainers to merge it. Can you please resend with both 
mailing lists so that the people in charge receive it and can review it?

c.f. https://git.openembedded.org/bitbake/tree/README#n29

On 9/20/24 1:38 PM, Simon A. Eugster via lists.yoctoproject.org wrote:
> [You don't often get email from simon.eu=gmail.com@lists.yoctoproject.org. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> 
> Signed-off-by: Simon A. Eugster <simon.eu@gmail.com>
> ---
>   .../bitbake-user-manual-ref-variables.rst                   | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/bitbake/doc/bitbake-user-manual/bitbake-user-manual-ref-variables.rst b/bitbake/doc/bitbake-user-manual/bitbake-user-manual-ref-variables.rst
> index 899e584f91..c203531f51 100644
> --- a/bitbake/doc/bitbake-user-manual/bitbake-user-manual-ref-variables.rst
> +++ b/bitbake/doc/bitbake-user-manual/bitbake-user-manual-ref-variables.rst
> @@ -766,6 +766,10 @@ overview of their function and contents.
>      :term:`BBFILE_PRIORITY`
>         Assigns the priority for recipe files in each layer.
> 
> +      This variable is used in the ``conf/layer.conf`` file and must be
> +      suffixed with a `_` followed by the name of the specific layer (e.g.
> +      ``BBFILE_PRIORITY_emenlow``). Colon as separator is not supported.
> +
>         This variable is useful in situations where the same recipe appears
>         in more than one layer. Setting this variable allows you to
>         prioritize a layer against other layers that contain the same recipe
> @@ -780,7 +784,7 @@ overview of their function and contents.
>         higher precedence. For example, the value 6 has a higher precedence
>         than the value 5. If not specified, the :term:`BBFILE_PRIORITY` variable
>         is set based on layer dependencies (see the :term:`LAYERDEPENDS` variable
> -      for more information. The default priority, if unspecified for a
> +      for more information). The default priority, if unspecified for a
>         layer with no dependencies, is the lowest defined priority + 1 (or 1
>         if no priorities are defined).
> 

This seems reasonable to me, I'm wondering if we should explain how to 
find out the name of the layer (e.g. it's often not the name of the 
layer on the filesystem, but I think it's the one that's added to 
BBFILE_COLLECTIONS in conf/layer.conf of said layer?

Additionally, since this BBFILE_PRIORITY file is documented in both 
BitBake and YP docs, would you be so nice and send a patch for YP docs 
(https://git.yoctoproject.org/yocto-docs/) to remove the content of the 
variable in the glossary and just point at the BitBake docs instead? See 
https://docs.yoctoproject.org/ref-manual/variables.html#term-BB_BASEHASH_IGNORE_VARS 
and 
https://git.yoctoproject.org/yocto-docs/tree/documentation/ref-manual/variables.rst#n350 
for an example. This would mean we only would have one place to maintain 
instead of two :)

Thanks!
Quentin

