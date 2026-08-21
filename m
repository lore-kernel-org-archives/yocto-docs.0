Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB8F8C5DF7D
	for <webhook@archiver.kernel.org>; Fri, 21 Aug 2026 18:51:16 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1662.1787338273570178085
 for <docs@lists.yoctoproject.org>;
 Fri, 21 Aug 2026 11:51:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=Cb/r+cux;
 spf=pass (domain: cherry.de, ip: 52.101.84.45, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iApK58eND2DT7YHWje+83FrI7Mb/Watx4WAOvuwAiYGH/fqbPDFU6lTCB5WtbPvoajp508gJKtDQAhv66fozX6JCrcqVBhoFapVIaB5AuF6wGcCU2772kl3248H/LIAJug+JwEJCwmDzqzBU5P7zrhNbb/gwcoP4S5mLF7lwawkVPoYbdtfueYnPCci9Be00JQWFmnzvJqmcKN+qpFXFpEagxGQ3waww6zit7KB8UBsr1JrU0+6DuCCsCaaVXB9Bxj5cYvKiTibZ706fvrIb8iaHtSTcCCCEkfUJEsA9dhbrdx2l1DlCGNh7deYb5Ez5pbtsyyjSQy1thpRT/+2uIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oGqVi36T/teiV6mgoK12M4NbEq0RrrefX2/k2PbjKsc=;
 b=dMH3DMEmXjIbVkWKFfGU17EKrWYfFhhdhSZTjHSzfwrQVH+ww9uXB5N9gSR6n7LFHG3ScYXfvchpJBmHQRmnaE9SKWlbbcspKwqb2G1qkgCJH3djID8RtfIbNWm+karDDA0Qifdu4bzhu3mTyxWuiU++pwizFZppzx8nsHYgPNWGXjanUncSxBBAdep8Gushebyn5H///dmYbX4A/w3Avffde4xWxcT3hvz+QWv0bDcqAhsBn2OkAuWptBUMGL88C7dNyTCuK+Abhxp1ax9ddB5Z2X5NFSaBqpoNbaeK6M4MfzPXDO9r9t3OUNJdvwa1MjGom84AuP9+NQwNCt+KaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oGqVi36T/teiV6mgoK12M4NbEq0RrrefX2/k2PbjKsc=;
 b=Cb/r+cux6JM47+y3mybhjO/iOEl7zoNIc5ydV9wFftTDD8rTD9QUrNKyjNHh/PyU7S8lghWiZR4XCzJEvigTw6JmU7tCUs3Wp4xsAGJEUt7XbigWf8W8MbWRsp5FmFI9N1Pc1C2Wcl2nKbYupv6rZFN+MzJeMdyx/05UWBSnZcw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from VI2PR04MB11147.eurprd04.prod.outlook.com
 (2603:10a6:800:293::14) by PA4PR04MB8062.eurprd04.prod.outlook.com
 (2603:10a6:102:b8::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.11; Fri, 21 Aug
 2026 18:51:10 +0000
Received: from VI2PR04MB11147.eurprd04.prod.outlook.com
 ([fe80::c859:7e6d:9345:afe1]) by VI2PR04MB11147.eurprd04.prod.outlook.com
 ([fe80::c859:7e6d:9345:afe1%6]) with mapi id 15.21.0339.008; Fri, 21 Aug 2026
 18:51:10 +0000
Message-ID: <b88a17fb-95f5-47e0-bebf-6fc22da64ced@cherry.de>
Date: Fri, 21 Aug 2026 20:51:07 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] should yoctoproject URLs use consistent protocols?
To: rpjday@crashcourse.ca, YP docs mailing list <docs@lists.yoctoproject.org>
References: <dfa91d03-3aa0-bf09-75e2-a5ed2825a937@crashcourse.ca>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <dfa91d03-3aa0-bf09-75e2-a5ed2825a937@crashcourse.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: VI1PR0102CA0054.eurprd01.prod.exchangelabs.com
 (2603:10a6:803::31) To VI2PR04MB11147.eurprd04.prod.outlook.com
 (2603:10a6:800:293::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI2PR04MB11147:EE_|PA4PR04MB8062:EE_
X-MS-Office365-Filtering-Correlation-Id: 4cf8f288-5c7b-43dc-453d-08deffb52a84
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|10070799003|366016|376014|23010399003|22082099003|18002099003|56012099006|4133799003|3023799007|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info: 
	RcRCFVWFohg8Lhb7DkQm6oNb98Stv2RAn996I3CWFWjZYd5U3I2xbv/ZQDnIrlE3tSl+m+54smgNoblkcGhgWx2HPjwSA5ar6/SHeuGburu5CnSBRdAOJDAVlaSu7UVyeoEqaI/a3O790guPmCahyljq/TYIWOf5Dk5NevIR298BVEvjkLxI6cuS+KOq1JAYvxlhbiBJogI8z2utbfG3usLJCUT7MCZLr3gFdl8R9dae0Jfe+A2BahYnxwrIm0D2XDwV4k4qJzuOYDTtcMwEv3tBthUrjluGL0YCGiP+GBMeFR7abywewiBVHFn5JkoQ2Vql3/U1/qOvQfOL+h+nAsKv7BrGpg9ChQTZdqi1k31wg7ISxz5/MzaQKj00UlCBL/aUZkyAKUP+UHgLb9LacQylOCrtTVVyQr91o01XFFleZu86JXLtDLCiGGqGDWFYHpWKcE/yuXAY1SxB2Vfnl3dg8Wl33NYN20btQZno9kGZOc06xc7zA3g4PJt1ULbIXYowYCAX+xFey4m9JdiJBeL9G3AJkADSxHlvN0NyD8FeDyOTR6H0ikniTui5cOXNVRzJo/mSVZJKnM8IlOWsoQOWFjIlqmCP182Xe+HHL8o=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI2PR04MB11147.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(366016)(376014)(23010399003)(22082099003)(18002099003)(56012099006)(4133799003)(3023799007)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?TkExS1FpM214YWZzbjJ5Q3VoSGZVS3hFc0xhZm96djkyb0ZnK2Fma3Y1ZVBu?=
 =?utf-8?B?Zkk5NzhwelRjRXJXUzBDK1VWRlFsRDJ4dVN2ZlhKd2tONGl3NWQwNTZyRTNK?=
 =?utf-8?B?T092amN0MTcrL0R4UTc4RG8xai80MmdoOTY1NC9rZ3VYdG0wMkxEY252czgy?=
 =?utf-8?B?R2FFWVh0MmJlRUQ5ekdHbGlUUzNqQ2c1Q3R6NE51WFlOZURGSzVVUDEyOW14?=
 =?utf-8?B?YTFyQ2FweEJud3ROOExQZEl1emNLdXJrSjUvRy8waTZwQ2RLTGYrNXhsWUxD?=
 =?utf-8?B?MWZjUEVjOTR1SUVQQ3A2Zy9rNEczT2pNRGRtZ0lRMlZjS2NKYy9wQi9Ga0li?=
 =?utf-8?B?YVRSWW5Vejh3K1QrUVRtQnMzN0Q5Z1NzanRsbXJvMjNEOStjRGZsVWFkQk5S?=
 =?utf-8?B?Yml1a0UzRmFaSVZ1ZUNiTWd6WTFaZGlJU2x6aFJ4QVYzQWN1R3ppNnliV0pY?=
 =?utf-8?B?alRXV09HaE4weXNYdXZuNlhEVXpReXNnSW5VT3dIM1RSVExUQzc1SFUxc3BV?=
 =?utf-8?B?Wk5kMnRlTlJ2SjBSTXd6VzVtT282b3NPL1JtV01SdEprOGt2bGdUcEdPSGJt?=
 =?utf-8?B?aEtjQzBnNlVES0pDZ1FCaVVxVVZwdkVBeFNsSVBMemQwNDN0eVJoQTJ3YTQr?=
 =?utf-8?B?Z3gvSUU0dGZpSUltL1QrUDBYelMwWEN6TlRhSVZSYk4yMzl3YTk4Y3dpb202?=
 =?utf-8?B?VDJvRWh1dDQ5UDRhNHd2M3NoVUl0cndxU0pFcGp3OUxXL2UvYUVJZWVINkNB?=
 =?utf-8?B?UTNFN2Rhc2RuSkVSekNSaFdteVB5c3ZkREZtWWZBRjkyZEVMMzBFalBUK3E5?=
 =?utf-8?B?L3FSblZmSDhQRXE4Z3MxTnRFTjBZVE4wYTlXbDFzUFJtb09jWUxkb3NOQ2NL?=
 =?utf-8?B?WEF2aExjMG9xbHNvTnd0QmZkZXBiY2tHcFZWN1lyLzd3R21SY09nVElEQzdk?=
 =?utf-8?B?Y2FxWmhyM2FzYSszMlNJTHVpbmZNYWh6MDczMzM1Y3FKdGdVRGcvZTdOWk1m?=
 =?utf-8?B?OTJJN0pzN3V6SmpOT25FWUZOOUtrRjY4Um1qcW94dEVOSUtMMDg4bkNYM0tT?=
 =?utf-8?B?WDN3NmdMd2J2YjFvRk54WFhDWUVvS1RMVGVJUlJqR2JPditSbGJ1WStDK0VT?=
 =?utf-8?B?WGg1b3FZVlJUU2I0UE1sb1JBWEdORFh3VVoxWENwYmFZQXFrVFNYN2JzMnRT?=
 =?utf-8?B?OFpjeFFPYlNPY2lXOW9KWkc3Rkg0VWFTN2RIaTZ3WGVJV0hJUkdpVG50cHNo?=
 =?utf-8?B?UUE1MlVOLy8zbjMzV1hyM0hPZUxxdkJOQU5vbnlZU1RUSXY0R3F3eDJpbk1h?=
 =?utf-8?B?L2k4cUJEeFZNbzJDWWZvbFRmeHRTK1F6QmNqbnd5VlJlRjQzOW1RanhsaUx4?=
 =?utf-8?B?eFpYSzBsd3NqMUJBNzY4Y2dtRDhLcEtjSUVtTTBWVkJGWXBqTXZvMzZFdy9l?=
 =?utf-8?B?bnJldjJhY3NIOWtFNFZmZ2d5Um5yeGU3M3ZVZlJJbFE1bzh6RDZTemgxT05H?=
 =?utf-8?B?RmdvbW9KR0NZMCs1alZENHJHMmhQVHQveWZncVNmaXkvN0xYTDhLY09jZ1k2?=
 =?utf-8?B?TlpPRWM4WHl1UEQxOVJOY1NtcXZJMjRHeWpjNDY2eUdCSit1QzlQYm1DQ044?=
 =?utf-8?B?QnhEekpaUVVMMnp0cG1LMGNUdWZuSjNVeXdlZEExSzMwQVJOVDZQa1ZmdnVj?=
 =?utf-8?B?RjVrcXFCUVFwaldPaFBYZll5ckhWWWc1M2VQL09PMFE0RnAwUXJXcStUb1By?=
 =?utf-8?B?djNDNDB5THY5NmptdCsyUThMcjRpM3ZEMFdKYkRmSk1YOWVoU3d1MDJmWFBR?=
 =?utf-8?B?QW93ZExrbmNyMENmWDJnRzFaQkdxeU1WdlJYeUxvREFlQWNQZFd5bWFqL3Zq?=
 =?utf-8?B?UzNNSEI1R1dvU2FyU3VOOFpESjNyY01xUG1QNjlkeEdIR0FLa2JIU3dEeThz?=
 =?utf-8?B?UGJNd1o2VkxDS2dJQXJoZDdNeFppSXpwbTR5NFlpMFBOVXJxa25vbEZ6Rm9B?=
 =?utf-8?B?UEt0N0NxamU5RkxndWZ1ZzJ3VnNjZGxINXBCYnp5WFlscVNvRjd0b09kL1p1?=
 =?utf-8?B?T2VKenNUMU8xa1JVNFV5b09LSGJCOGR2UlZyT1dtNEgxbnk1Z2NISHFsb2h6?=
 =?utf-8?B?VmxnNlBVd2dGVUZkamk4WDV6MDVZb203R3IvSHJoWGd3L2pvNmIwMWd0YkdK?=
 =?utf-8?B?aTBYQjlGczhZWUFWcVRsdVRyOXNkNk1Ka1R6bHJ0WEh4TUdhN2dPUWdZbEdt?=
 =?utf-8?B?QzBLK2o1WGdnd2FiUjNOcWpJMGJtV0Q5UWJib2VBcklhTjVSUDFCT0pJK29Y?=
 =?utf-8?B?WitTZ2Q0S3J0Ylk0WlRaU2o3RE42MFpFS203aEw5NlBKbEF4Ylorb0RDN1NC?=
 =?utf-8?Q?2HRE9u4DH2+i4LBW/COHlKxoaGc/SWNl65EFl/LP4lqZI?=
X-MS-Exchange-AntiSpam-MessageData-1: kzlDaYh3mIHctyiCTab8pIe0aohTq9zfQ0E=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 4cf8f288-5c7b-43dc-453d-08deffb52a84
X-MS-Exchange-CrossTenant-AuthSource: VI2PR04MB11147.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2026 18:51:10.1831
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V9XMhaaaGaSGIUU4q1R7aKyhQIAc8FLfwfZuDiJk2srrGiKs2YimivdEQih28XVUV85cRpF1YAKZZ46d/tys58Y0U/msyBR5stgoHZBLKPk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB8062
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 21 Aug 2026 18:51:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10318

Hi Robert,

On 8/21/26 6:22 PM, Robert P. J. Day via lists.yoctoproject.org wrote:
> 
>    just noticed that the docs files bounce around between:
> 
>    - https://git.yoctoproject.org/...
>    - git://git.yoctoproject.org/...
> 

We don't support the git protocol anymore as far as I remember, so we 
should definitely update those to use https instead. Please check before 
sending patches, I cannot do it right now myself as I'm traveling.

Cheers,
Quentin

