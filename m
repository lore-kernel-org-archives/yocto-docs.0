Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73381CF45B4
	for <webhook@archiver.kernel.org>; Mon, 12 Jan 2026 17:33:25 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.13])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.38800.1768239203428254188
 for <docs@lists.yoctoproject.org>;
 Mon, 12 Jan 2026 09:33:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=exoLRHdP;
 spf=pass (domain: cherry.de, ip: 40.107.159.13, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Aba68IvZ7KA1mc6FpYhIK61H8U51PNtbqQzBzcHV0TGQc9PXVE4NJPyeu+sTkpXSHakQuCguuv60eXhwH4vRawvpMR93kIH1b2L6ljoJ0vZh6JnlsZXAhEbcRTNonbJtt3bgI2Dpwzo9bJ0SZq+o/jpniDD4OMt9nacdzNTLQI6NWOtcSsrWwG6skb0J7gl+n0FTqohcO5I/rPyEk7/sTVKnERmsZGufkD11P2DbYYqHHSkAHfPIoWXXGcJrABmaa9+N7/FrPoC9GvDiDftNqGoycwxldkzHgF6Xn2yRckeHRug8HUneZEJvSID36hZRQVkj7ymfmuRRFgJaEW1nBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P5fPWXueNqSlzpfKbx6rSHPETaiUKEeq/vpKdrmV0xQ=;
 b=Nlc07Z9Ew+/eXSIID13gwAAaqKoqjdDKg1ot6Po8mtJflTeyPPkeGPUjMIpU+IUuSegePxPgSzilm6Onj1bvWrrdWmP3m4jrjWCWNC0b/6ntP6nKGZoiqLPj1Ka6f8I3yCtQfqnjuOTNPpknNnH/3+TqFHM6JT6x8VYUAvBbMBSzRTDXzGOu22FfPtHlRHNCHVqYeTvBYI1xBD9YRXxLdg5dZLXEm887y7YcR6yQS2rETN6tj58PHyP73ztZXLtN2lu3shslI3RAJjmJptseLVlEJECAu5Z1elBEWZVKEtAJoi93wzCSAoF2gsCYCMRIpHbJNO2r02Fj53xvNWqCsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P5fPWXueNqSlzpfKbx6rSHPETaiUKEeq/vpKdrmV0xQ=;
 b=exoLRHdPSFfZ3ze6fBPkh+AOQyObrHcZU/Oy7Qjoc3HfGnhbajXjAc9UENwLnTd81BRs7GeC9gwO0urOtKpMjsi1emiq5WpR2eFgTJVSq9wxg7tR0AETWODFzysCf49PS8U61jL6AbODKeRgfYBPBxgIgKO6ocqyERYwtWId+Ys=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by AS8PR04MB7767.eurprd04.prod.outlook.com (2603:10a6:20b:288::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Mon, 12 Jan
 2026 17:33:18 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad%4]) with mapi id 15.20.9499.005; Mon, 12 Jan 2026
 17:33:18 +0000
Message-ID: <ad2dd0e6-02c8-4851-999d-189307c123f2@cherry.de>
Date: Mon, 12 Jan 2026 18:32:09 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] significance of leading slash in BBMASK examples?
To: rpjday@crashcourse.ca, YP docs mailing list <docs@lists.yoctoproject.org>
References: <3b9d5e4b-700a-5d75-d29a-dea8b8ddea9d@crashcourse.ca>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <3b9d5e4b-700a-5d75-d29a-dea8b8ddea9d@crashcourse.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: FR0P281CA0053.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::17) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|AS8PR04MB7767:EE_
X-MS-Office365-Filtering-Correlation-Id: fa37d18d-de63-4845-cc0d-08de5200ac5a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?bkF5cDBVYjdlMm1tY0hlU1RkUnRrMnl5ak9kbjZJeEZNazV6MWkzVmlFRWhV?=
 =?utf-8?B?RllCcTlYN1VVRmNoRnJxSHovYVlUamJCUmZPRGs1SWtQb2ladkF5QnIxYU1z?=
 =?utf-8?B?bHNRR3FhcXhjcWdVQktSMnlxazJFZnp4S2EyRzc3YVZJelFtOUJZcWJqZ0F1?=
 =?utf-8?B?Z00yak5HSGMwd0FuVFhpQ3Rzb004RjFCTVkyUGdNQ09zTXVOVlM4MzhYWTAw?=
 =?utf-8?B?cUNJYjdaOVJka1g5MlduMUV5dk45TWJ4M2tyWFBGd3BXRWtCalBtdUJFMTJ5?=
 =?utf-8?B?MlhIS0V1c1dDbmhXbjdyYjVML054SkpWNVhqL1kxdXFaVkc1cnQ3WE84Vmx0?=
 =?utf-8?B?VjIybisrTjRMSno4Yi9JZjgxa1hxeWJ0QUFoOVBYNzMvQllNTU54OFFHUmt6?=
 =?utf-8?B?aW1SUTJLTDlnSC9oQzc0T2c1U1NiOXo0UDBvaThldVc0aFlTWXRXUWVJOFVs?=
 =?utf-8?B?MExRRnNMZjFoRXM2WVlmQS9xd1RjZHM2dzBEaGZNZ0YwZnJ1Ny8wR21GTWlK?=
 =?utf-8?B?YnZLWUFnUlpGcFdlS3lXc2p2Q2kvbmtOMWVPdDlWM3MzWlc2N2RVeFdqb1Ex?=
 =?utf-8?B?MFNzbStpaHdWVml3Slo2bmZ1TVdFSTBrSGttcVMvS1NOT3hZYUpYREdoa1k1?=
 =?utf-8?B?R2ZrUklNUFFRdW55L1pqeCtZZURCKytXQnVrdEQ0VDNQVUVOMDBpY21lR21T?=
 =?utf-8?B?VlV6RGR4SnE3QkdLTk1tZzVlOW01bmZtQUM5Z2lHaVZ2Z3VBL0RqRU9LN0tZ?=
 =?utf-8?B?QzFlY204S0s5NUhnTEdCOFVSRlYwZmk1czd3K0FBdlZEby8vN3Fmamk0VjNE?=
 =?utf-8?B?ak9sSU1nMVpOdldVdERXSFNuNTB0eTVuSjZSZ0VpaFRrOXFZenNXblVHcTM4?=
 =?utf-8?B?Q2thd1pUeEFQRmFCZm1qYXBmOWpZejMvd3BXaG5lR25mdE1wNVBnQWNIWS9m?=
 =?utf-8?B?NlE4eFdmUnVXSGFka3ZlL0pqY01VdXZrRmdrNjJOVXNCa3VJS3ZsRlVXN3lJ?=
 =?utf-8?B?VlJzYjN1eFVQUU9JNnZBb2FUSUllUlpSVkVHdVI2czFzWENiY3FHelZ1enM5?=
 =?utf-8?B?ZjZxMmt5U1BwSDBiQ1llVTFjUmltL21mRml4RkJ4aG42V3dmeUVaOHNiNWQ4?=
 =?utf-8?B?andneWd3SUZNY0k2OUdicW1hSk90Rkd5RmRxaVkySGhTc3I1aEFySFppY0xT?=
 =?utf-8?B?WnZnUEFJd3E1MnNyaURqcW4vZmJJM0QwWkZEb2MvQ0ZGNy9jUk9vV0xvY0hZ?=
 =?utf-8?B?Y0JkVElWZnhoMnZZa2c0V0hRWUN3aGxkTnRTSGRoaXdoaUdMUExjOGhTZ1dJ?=
 =?utf-8?B?Z2ZrbEpsSU9kY2hRMFlFdGVCb2NpOUh0QmVWMDJKbUZHMm5lMmFqSjEyd09E?=
 =?utf-8?B?N2xvRW1aYVUwTHNrRHkzczkzSGQrakNucTlXcmJ4R2pieVVTZTdNenZEWEV3?=
 =?utf-8?B?NkZmU2dSNWNMU0lCZlJ5NER6K1U2MHVhSWxCUTV4VUZMV2JQc2NaT0lQZlNv?=
 =?utf-8?B?ZlBSWjE3UCtzZ1lDOGF5bU56aTlqbTBqUG9jdUVyekp3TlN6RWVzcGZta3NV?=
 =?utf-8?B?a1Fqc2krdGJOT0kzSTBVUFJ4S2N5M3hqSVhxdkxRZmtOR29IbStxZElBbkp1?=
 =?utf-8?B?eEFaOGN1SlZrVlg0b0N4MHhXUE93eEJiUTd6dnVsQjZKS2hPVndKdFcxQTFp?=
 =?utf-8?B?eU9iUkRML3g5WEpyL0pnemxtbHE0akFFbzNHMFhYSXhFeEh1encra0hTTUdZ?=
 =?utf-8?B?SGZ0azl1QzA3NDVNZnFzcXlmMW5sb3Eramt1bUFoYU02ZDdXWC9ybmNGWGxl?=
 =?utf-8?B?SEthcDM0UHJNVklIeEh1TXI0RUkwbk9zL1FoN2VkVngxdzhaWXNwcHBMVHZu?=
 =?utf-8?B?b1V3NHhTdTVaVXpDQU1lR2cvUzd1RGdlb0x3VEtXSWJpYXc9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?NEFuVTZ3akFHMUkwVHdJRXo3T2FxNklFckVuTmxTMEx6bWhaVVF2ZDFYTTlY?=
 =?utf-8?B?OUhVdzNxRm9hODE3cnpqVVBvazZrVnN5c3NzUERyMFk3bXB3MjRIdnBGS0gw?=
 =?utf-8?B?cTVZS211T29UVTMwQ0JaOGhRRk53WXNjQytaa3N6WW8xSFVyUTR0RmZ1TWJr?=
 =?utf-8?B?WVFPMENzQ2lnd1hySEdPVW05RkRhUWNURXRxNk9GRERWZWxVUGU4QVRvNWdx?=
 =?utf-8?B?eForYnE5R1JEek9uaXRJbFFVUU5EOUxtRTFhbmZ5U2V1czFxb3ozR21Cdmtm?=
 =?utf-8?B?V2l0eGo2MVhtbG9WVWgvbXExQ3NSeGExWklQTk9jclJ6LzZjVGFod2lZdDZD?=
 =?utf-8?B?OVVEd3B2Vlh2SmxLUzdIZ1BTR2tENFFkdW5hb1hPQXoxU2lrQklObndEaE0y?=
 =?utf-8?B?WnkwRUV2Tm1KWDVBbFFKYzZ2RHlxRHpyUHdRd1JYa0VVWGhnSVpjcUhPODJ6?=
 =?utf-8?B?a2VhREZGcWNUZVR5MU1iN1NvdE9lNFd0bjk1ekZHc1RxM2V1TkR0Zk14SXBt?=
 =?utf-8?B?cVNiOU9RVmVmUXA2dUNERUhVWm5ZQXQ2OW1CaG9tQXNhUS9VekFnVWxnaW9O?=
 =?utf-8?B?WEdXbVZQNDFsa2d1ajltZnNNU3RCdDNUTmZNQzc4QVk4SHlsb3hXZUNMTUw5?=
 =?utf-8?B?VCtSUFdORzU1djVYay9RQmFURzkrNHUzeWJNZkhkTUVxdkFhZmd0cGhjNXZ4?=
 =?utf-8?B?bUFWYXM1cm51SjkxY1pMUTV4MTJQV2s1ZjZuVVVNWXlJZnc4Tk9hd2hMVllX?=
 =?utf-8?B?ZUJJWFN5a2M1Z0p6SVRaVExzalhTdUV5UXV3K0NscGNyTmt6R1JRV2pVaUZU?=
 =?utf-8?B?UnJFSjdpUTRYdzd2MTMvdUg5WmpYcFdEUmx0R21HVTY3emsxVWVNUy8rQ1pt?=
 =?utf-8?B?TkNWbVZEcnFYSWtEU1ZGUmhyV2t2NktvUkc4cnJJVCs5N2dQZk8xcjRWTTl1?=
 =?utf-8?B?U0lxemRYQS9mWS93OExvS0lUemJON0tNMDllOFNOWGpBekpnZ0ttZXVaWUhG?=
 =?utf-8?B?OVJOakwreUVxVWxadmpZblNrNERNS1paVVloUmF6REhUaE01a1pySDRXNCtI?=
 =?utf-8?B?ZXlUVHA4WXFESWlUd0hjVjJTYVFudDRvYTRiMmJxd3IzVEV3L1l6UW9JK3Fv?=
 =?utf-8?B?V2FhUkJuSEZsT1NRbThVL0FuVTQrN2g1U3FuNkV0U0o3VCtyS0UzVXJIVEJq?=
 =?utf-8?B?V25WUU8valROZngwM1RmTEJZSzZENDl1ZWh3RnprRmpNclNTQTB5bi9wTlNu?=
 =?utf-8?B?a053dDhZdVM0eWUwaXNHN2tXa21obDVEdHl5SEh4YlhWN0JHWWxEYlZsQVU2?=
 =?utf-8?B?TGxkVnBEVEpKRERLQjNKWVZ0UzlPZmJrRmJaOWtNUUVrd1ZjSEVJL0pUd1pp?=
 =?utf-8?B?ZWYzL2I2Q0tzbld4TW1yaFlHUW9oS2c2bk44WkdBclg5c29oK2tqZ0szdjAr?=
 =?utf-8?B?WDJIbmJBcG8rcHc5MTN2cFpKSWFqUVZnckVCM2F4RldGSXEzeWdia01IRjBV?=
 =?utf-8?B?c21YNFg0Wmd0U2Q4STQyTVZoZjlSN3IzMVhUbmwvNnVwWEZmYVg4WjdWb1ZS?=
 =?utf-8?B?cXN4OEJibkNpWTN0blZWRVhZSGkyUFFaazZ6bC9pd1BQbzZyRE5TeE5iVE16?=
 =?utf-8?B?QXQ5UzU4dWZBd3QyRnZkaGZrUHcyUkRtTDRyY2diSU5ja1ZhaUVJSDZoSGtL?=
 =?utf-8?B?c3R2OVYrYmRNblVDTFF3QWMvVmJrSWZqdGo1eWZsTHNtMEt6cWJSRmVib2pq?=
 =?utf-8?B?WW1vYkF2b2lPbXV1dmVhcEN4endwOVZRd1lJdXJyMnF2WmFVQWdQaWE3SUNC?=
 =?utf-8?B?MC9LbnhUKzE5QWh3K0xxMG5TQTRJN2pJU1lJRzhxekREc0JCSVBNY1JML3dp?=
 =?utf-8?B?Rm9xWlJ0ZURyanFZbDh4eUlTRUd2R3BSTDV6c2V5bVM1djZ5dEJiMkNQREpx?=
 =?utf-8?B?dDl6UnloQ3RDUSs1TVVIaEtUQ3JseTJFMGNDRVJnbXNjVXBQam01MzVTNGJV?=
 =?utf-8?B?MFhYMnVJWkEzOGV2R0xJVlVpbXdJSllHU1dIZXdyQnJLY2JYaFpDNFgzTEdu?=
 =?utf-8?B?NjA3cmRuekszc013VXdBRjR1TThWeFZQWGI4c2ZscDBpekdzcmxGSG5kWlFK?=
 =?utf-8?B?R3h4MEVTcExzbHdQcXBSK1d1ejFXeS9TM1ZYTWtQZG1UcENrWlZGTCtjQ2lk?=
 =?utf-8?B?Q2hwREdWbUpHbVpzYWQwVk8zcHpobVVKa1BUa05jVGhLcEc1M2ZJY1NpMkps?=
 =?utf-8?B?bXNBNElhNERTa0R3SDU4dEdNV2tQRENGT1pYenRzVk5tVVpjejVTUTRzbFhC?=
 =?utf-8?B?d0lxUU1raXpqTE00V3pVN2IwQkRGbGlaUG9CV3dEQUprSjB0YTdEZz09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: fa37d18d-de63-4845-cc0d-08de5200ac5a
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2026 17:33:17.9262
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s7NrlZT16yGjPpeLRoCJnYonAVFgD4iEahmynm7ENl+7rls0624G3XrlfVFnRLr9ihK/k8G6c+T32d5zvduedhBY1byv3Mk687egfetjZ94=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7767
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 12 Jan 2026 17:33:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8471

Hi Robert,

On 12/18/25 3:01 PM, Robert P. J. Day via lists.yoctoproject.org wrote:
> 
> here:
> 
>    https://docs.yoctoproject.org/ref-manual/variables.html#term-BBMASK
> 
> the first sample usage of BBMASK does not include a leading slash:
> 
>    BBMASK = "meta-ti/recipes-misc/"
> 
> while the next few examples do:
> 
>    BBMASK += "/meta-ti/recipes-misc/ meta-ti/recipes-ti/packagegroup/"
>    BBMASK += "/meta-oe/recipes-support/"
>    BBMASK += "/meta-foo/.*/openldap"
> 
> that section doesn't really clarify whether that leading slash
> is significant.
> 

Looking at the code (starting here 
https://git.openembedded.org/bitbake/tree/lib/bb/cooker.py#n1893), it 
*is*, but to a different extent that you were probably thinking.

These paths are passed to the Python re engine, compiled into one big RE 
(with | between them) and then .search() is called on the big RE.

Then BitBake reads into BBFILES (which is a list of absolute glob paths) 
and keeps a list of all files matching any of the absolute glob paths to 
use.

For each file in the list, the big RE is run against its filepath. If it 
matches, it's skipped.

Now, imagine two layers meta-my-meta-ti and meta-ti both with a 
recipes-misc. If I don't put the leading slash in BBMASK, then 
recipes-misc in meta-my-meta-ti will be masked whereas if I add the 
leading slash as in the example, then only meta-ti's will be masked. 
That wouldn't get rid of the case of meta-my/meta-ti still matching 
though. I'm wondering if we shouldn't be using ${LAYERDIR} in most cases 
like for BBFILES? How many meta-bsp will we find in the wild for example :)

This is only from reading the code, so maybe I got it wrong. Should 
probably create a small example to verify all the above claims.

Cheers,
Quentin

