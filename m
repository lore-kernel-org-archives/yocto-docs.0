Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30A8CCDE000
	for <webhook@archiver.kernel.org>; Wed, 24 Jun 2026 10:56:37 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4253.1782298586236276715
 for <docs@lists.yoctoproject.org>;
 Wed, 24 Jun 2026 03:56:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=H71PCKCa;
 spf=pass (domain: cherry.de, ip: 52.101.66.42, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lYo0hzkWSoXPiW3GLPjFSl68rTPLeFSHEpbtqYV/2c6RiwRyVqtzvqijo3BL+oWL7IlZP2vuQc/GeclzWb2fHc9IJOwP5Ok7HQE5oJmTTHc31Hb8MpIEX1z+LP9XHUTA336M4eWLT5423ZXxeONUBGCOQudCxjKw/r6z5+Pnzh+RqwosDWF/7vq6cv80PBqj6G/XO5wQ2Orqo7HoBKeib1OnN1NIFOtNOem68PApC6bNnsBVMuBMxMSWjoyFnxxHXFbX4i2zHWZVy9gJr1Ff+KnEucLxvDmwLOWWrZkbAiyJDNlkroeKUU34CKRktziNG+rhHGGwwMRnrPf6Ae+eMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+vjoPR55f9zFmVsu3u48DQiwBMaBr3l8a+3tWUX5Rh4=;
 b=MZJaHtfABVV3r8ZMfvkAN3WH0L53VcpKRxAVA8UxFqyQLRxj5fHqzG8K3zx3JtffhrIH1eerXkY5yYUIwGDAqpSGJ7QBltGY/Ljv0nAKmIzvIpzAoKAU6XZ4tf4qB8SRR0JiiLUiDOdSV5uN7l2GCHCJ3+jJcViESy4FlLEk4ENAr66KocDps+FeIB6EAO9vpRTHCPiyGwL3TQ6H0PqQGgyElF1IKam5uCzoCQsQc66241wEPGQarDL9x/4MD5g8fyzrS4lT5CzGl6I6ySctXj/GQuGyPW1eInz2VmhxiHDcR7eg0IIF1CCfmu+PjglWsGH4NgPsTHb/2o0Pb09KXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+vjoPR55f9zFmVsu3u48DQiwBMaBr3l8a+3tWUX5Rh4=;
 b=H71PCKCaVRriPZisFJBu7Jy5hpwFE2wrDGMhWj1ZDbHgMeNsAWG2aJW4bkKjtfaylNVNG1kUpClRzG9x18s6mQu7lWyIdRx/j1zuL6+lvvOCvqXEZyLUe8DwNn2fWqlshDSB1qg25UHvswWa9XPeHCXbi7Njt4ukzeORok5TblE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com (2603:10a6:10:1e5::22)
 by AS8PR04MB7558.eurprd04.prod.outlook.com (2603:10a6:20b:23c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.14; Wed, 24 Jun
 2026 10:56:21 +0000
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00]) by DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00%5]) with mapi id 15.21.0139.018; Wed, 24 Jun 2026
 10:56:21 +0000
Message-ID: <f2a68e35-0218-41f3-b589-a1b75e392093@cherry.de>
Date: Wed, 24 Jun 2026 12:56:20 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH] ref-manual: under meta/files, mention Wic files
To: rpjday@crashcourse.ca, YP docs mailing list <docs@lists.yoctoproject.org>
References: <97f6205e-b80d-d845-717b-8a71bfca415f@crashcourse.ca>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <97f6205e-b80d-d845-717b-8a71bfca415f@crashcourse.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0176.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a0::11) To DBBPR04MB7737.eurprd04.prod.outlook.com
 (2603:10a6:10:1e5::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR04MB7737:EE_|AS8PR04MB7558:EE_
X-MS-Office365-Filtering-Correlation-Id: 51d14502-b6f8-4e06-7188-08ded1df3a1d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|22082099003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: 
	gaD5lqGEQvqomvD1dEMmnZsBGPN3s3kBGoknS1D3PC3BKRQISfnM+xZZo5W/u8DtZayNAbkDOadNtnTTBiGXiZYPhnsk6H0dtmnxv4hqho2/DnkfzYsx4kNYMoolPrbmmgJKVVQJM+xrvf/64TjFkuJ7Hg5gZD1OEFvVvj51aCCkDvnzr0pJDRYUD0uIYxKF2f/hlmVTJksD2cwpWYd3bIJ4DEkt8FMKMiU05dQt/soPaOHuBCu9yr9Rj8MMwT0ywcEIC36iiWj0b67a/Bz+beYCbTdRGectn8N+CTkbVQmWv4p9cXw2oz+erdnyrEBJmLdDXytgDJSnqRgrYfAgbquPd8fZ46XhtM+OtW6S8Sfh31ZZDmMjDuTcFdiM7+ktEWh33ajks/ceQ+u+FlqmbAsBnRyw3ebdvZggv0TaS8qz7wpKlSDglB8Hc3trdjWs4BrWaMUYwLIW5lAmzQSbitVRUkpFSQiXY/0aTjud9YEWBH0t6NYhgfBeUEBY9Vi0g6jJ10z7YnhLDVouabb46lkE7SjxZ1uM+A1Fp/IlUnQbKmr5AOs44xf65/UCSpvpLFs6/seahG2Ndgu32i3cdpekH5OX8W8h5cHf7kkJt0pUlq3TcLwi6oIqDdQmiMh5ByjxhgTTiLSomfQR8kBUNUGC7I0+rd9FUfTzhzhcqUY=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7737.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(22082099003)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?RXlYc042QzZKUFlHZExpMkJKQWNXdXlacXd0VG93Q3pqWFdCZEVnbnV1ckl5?=
 =?utf-8?B?SjFiRnlKWjNEOXRFODBXRXZlQ0ErV1lEUk5rbU5wejQ4dGxscys4MDVFaVNW?=
 =?utf-8?B?SFYwTWwyVDU5a0lUQ0hnVnhJQmQ2VGcyUnE3a1VtRnNGbGY0RDNPUnlPajcy?=
 =?utf-8?B?RnBaQnkxamEwcEd0WVJBeVlqUkJtU05PeUEwenMvMjVuTzNpRGZnWXNuTzJJ?=
 =?utf-8?B?UmNHLzhTaTk1ZXU2SHhrb3B1Z01aZUpUaFV5OC9vYnVJL3cwQ0dxZ2RrbmJR?=
 =?utf-8?B?UEpuNjJvUGQzaGdJb1FCV0pPT1U2SUdSWi9rd3pnWWVlUmxkZU5WTk5KbWs4?=
 =?utf-8?B?U3dkZmwzOEhUOXlyRVoyUHZtZEFqejBjTkpkcCtPMTI3SXpueGFqYmw0Vmt4?=
 =?utf-8?B?UWJiN1pRam8wYnZjUkJsb1lKOCtiK3ZZMlZDMVNIYXBxbE15bDArV2Q4VWJt?=
 =?utf-8?B?SkZMSENwcGVXaTRYZ04rbjNmUUtLeUlYaURpS0d5clpmd0hscFdaV3VPVU1T?=
 =?utf-8?B?a2h2eGJ2UVVpcWpRNkkwN0xTMkxFU0xsVU9HSFVnWUh5d0xnQ3B3WnM1dDJW?=
 =?utf-8?B?cFFjb1BlUURMTER0NUc4dTlGY2RKRktNQVlZRkttNjRhTnVqb1B0dGlpLzBt?=
 =?utf-8?B?cysxSC9tNzcycmZpdmxIYjhtR1JSR2VVVkovNUZ3VEoxTm9rUTRIU09oLzZE?=
 =?utf-8?B?SXZ5TkY5UHNwanNIZEx3V0ZGdW1ZQUg2MmtpS0dtamFKc1hWTFJYZHZoSU5u?=
 =?utf-8?B?S2JCWmZXQlo0OUZ1VGM4blZmTjBkcURieHBMVEpnVHlWRDE3dVpONW9jaWRC?=
 =?utf-8?B?UVp6TTV5VjBxdGkxbUxRWnNrbkxoNFc4a2tBOExOZ1d1YVp2bnR6OTlhRVll?=
 =?utf-8?B?VUJSWDc3eTZVVXhVdXdZeGVJam1YZGF3THZwUUdKRzRKeTRobHY4VVRzUG5i?=
 =?utf-8?B?RWl3WEZIVVNRQ0ZvNFQ4b3BhZzBQc1JuN2hTZlhGSzltd0tDeDJsdmNIU2hu?=
 =?utf-8?B?T2d0U0xhSk1zN3E0N3RYUTlRb0ZvdlYyS2pKU1Z6NUlPbmRRUXlGeVRGUVdB?=
 =?utf-8?B?b0xmV1hPaVNsTlJhd3JMSXBIYUthN0dDNFJMNHZLT2FPZVpJUjZyeldwUmQx?=
 =?utf-8?B?b1dWOHBqZUVzWjdhMHIwU25MNUxlWU5FVTF4ZHVwd3VBWDV3eGdwUDlnanN1?=
 =?utf-8?B?VEJQWUh3Vmd1VytCbUtUUlNMcVhLZTR3ZjJXRVRhSGZ1c0MwNXFzVSs3YVdN?=
 =?utf-8?B?RU5lMXlOQmdaVHcwZ00zai9BOGFNTjJ4NFpmeGU3RlJ1dnh0OWlkZFp1YUVs?=
 =?utf-8?B?SEN3QTNlN2pwUG1tMGl4bUlnb3B3SXhNbGs0b3V6OHBiK3grcHZHeUd6RXhB?=
 =?utf-8?B?djZnN3N0MW00UUNtZG9CbVAzODhyREdrb29OVTkwQ3Uyc0M3K3dFQStVQlJy?=
 =?utf-8?B?MzRYT0tvUHlhaVNraE5leWhGOUtsd3ZaVlV1aG5jOFdTa05NRWlFVXNmRy9S?=
 =?utf-8?B?N2xnTitlU2Y2TUI4dThWZzREYzUydnBjdnRuM09vQ0lvWDhDTUs3YUQrWnR4?=
 =?utf-8?B?R3JMc0JGY2M1TS9uR1dzYnNJa1MyTmtxRlJFUW9lUHRpSGdLbjBkMlR4N0V0?=
 =?utf-8?B?d3BZOEh4aGwrYTVZS3hJR2VVUGlkaURvSjU0T0YxVzU1Q0ovNDVId3Bld3Fh?=
 =?utf-8?B?UFh1TXhkRm92aGZsSXh1V290eVhrdVlRazNZd1Q2MmJFdmwzeUxJbTVoN2tR?=
 =?utf-8?B?UW5JWTZObERZVnhUK2ZBVCtGMlhXcll3cVRNSnl6M0tjemdxVHZjWC9ELzJz?=
 =?utf-8?B?cjN4UFFWandnRU9BTEFnYkVkcEtRMXZKdXU3NXZDTUV3NnNXcmRvSzdUdGZB?=
 =?utf-8?B?eEJlQUxVNXdBWU5MWXJBTmViejg0VE9OdlFsWUV2bFBpbDFSMkMwQWw1UmZi?=
 =?utf-8?B?NWNScERWN3NjUDJyUkxVT2JEam93eXJkV1Y4Y2pHL0pWMkFKODZVMkFXV3FS?=
 =?utf-8?B?WmRKS2ZSbmNhR0huZHR2eTF1YmpwQWZrUVpiWTBlVExCNFFFMHNTU3V1d3dR?=
 =?utf-8?B?T2xvUTFkZ0F1ZW50Q3dGcVlsS0ZCTjBXVlJsTHR2Y3U2VmpuaVdmREdVN0Jt?=
 =?utf-8?B?WmNoeS9pQ2tUTFNpR2I0d0hhNUhkcGl4aEpYblhrWVBocC8raWRLUnZ2Nlha?=
 =?utf-8?B?Z2R2QTM0VC90aW1JZk9MZXFzTEU5d01mTEtCcmZPbElpQkRHcjRYbWpDTGgz?=
 =?utf-8?B?TW84cTdHUWZCTkNqY2NNdk00N2lLc0N5SkdPTm5RZUxMWjdSeHV5d2YvYk1K?=
 =?utf-8?B?SUZKZWZQV0tIMkR2OTNnTzFoM0ZheEl2Nk1VL3RPSWNaQy96K091dz09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 51d14502-b6f8-4e06-7188-08ded1df3a1d
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7737.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2026 10:56:21.7548
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yPiVtB0i8jk45HYU05YGofBFxDflMDWehcveyGJt953hPBPruaSA0Iam82ydpkudTUlHbmJOJM4i/3W82dPDKR0o+pklYkVprFeWXyvlKkE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7558
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 24 Jun 2026 10:56:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9860

Hi Robert,

On 6/22/26 9:44 PM, Robert P. J. Day via lists.yoctoproject.org wrote:
> 
> Add a reference to image Wic files under meta/files.
> 
> Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
> 
> ---
> 
> diff --git a/documentation/ref-manual/structure.rst b/documentation/ref-manual/structure.rst
> index ff84b250b..a55b3ba56 100644
> --- a/documentation/ref-manual/structure.rst
> +++ b/documentation/ref-manual/structure.rst
> @@ -868,7 +868,8 @@ layer.
>   ---------------
> 
>   This directory contains common license files and several text files used
> -by the build system. The text files contain minimal device information
> +by the build system, as well as Wic files that define generated image layouts.

Please always try to find cross-references we could use.

Here at the very least the wic dedicated page /dev-manual/wic or 
possibly rather the WKS /ref-manual/kickstart.rst since I'm assuming 
it's what we store there?

The wording is a bit odd to me too, it could be understood as wic files 
being a representation of image we generate but it's actually the 
opposite! wic files are used to generate image binaries!

Cheers,
Quentin

