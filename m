Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.31])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13326.1795091414971475325
 for <docs@lists.yoctoproject.org>;
 Thu, 19 Nov 2026 04:30:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=EaTt6Jg0;
 spf=pass (domain: cherry.de, ip: 52.101.84.31, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a/HajyWF1RHC0EzFJ0MoNCyAVYDaxO8rZm+twp9hDnQv8JIFABdK7Ez/i7cXywx/5faGJ+H6B43rZ/WxhHlLynYJDZH2b6rEGU1kld7VeCDWoI+/r40l3fjPTi8jmIocE99VaEiMYoZILlkPJMHZimqsKAXqt4x5+TTncV21rITFH2KvVjGQA4TmKGrlhoSUtfhXON6qPVSq10X4O8aYQd523lqdy2yqO5ypu7jc5oZqNDWVWi5zZCZikLbE+jJa16h32CfcirpX6j4iSS4hrsu4Blbt+84gMFiWmt1xzCF/ecSKH2f4KTtEfQwENZKsweQMV1cjCfrNRYtuFt0hbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bfTIoLAOaDv3z5jRJdWfXJcZyctpyKlZyCwfx2U/Z0M=;
 b=EzAoV2vsBWoMr7RMlRzOhGOMXl+XXJgWfEDPOfwlU15NJjEHEFEzFMcAXwVp/UJv5yeFdys4Bp9kFXJYs/tU9OQvntuRDinJhvu5zXmXMseQRJcURjbCA4bCxx+sGMBwRiINqafWQCjF7jIBLVvzop2uMIpNr1IgBzJ1/lMh0ifnoMiP8FiX+jOcqoyovvvAegzQoUaj9aa7wrTWPHJwlCVjzNGS/48ZdRLCRTB+N3FY6hZLPdmQZJ7obnFCaFWylmFH+kCbABFcIA7gfeD8RK66Ee/oPUQVPYaPzE3dd/TRp3fvg65z9MV3LJuVdnmHHKJ/MglJkyGKW7wbrBOX4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bfTIoLAOaDv3z5jRJdWfXJcZyctpyKlZyCwfx2U/Z0M=;
 b=EaTt6Jg00c+QaitZAAJv2eHnAAOomicMXx9R/CIzTR6q8wOFYbTN514aCq+xGU1LrCb6eoYAwQ1PKDN3DasRgUPKbIzChX7cGSEGWUwdvSuuk1sadCSShUWeRg+YKJVhk2NNZp3RcIF8/FxOoZJxkyE90+WV8apd0GsVI1PZmwo=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from PA3PR04MB11153.eurprd04.prod.outlook.com (2603:10a6:102:4ab::7)
 by VI0PR04MB12661.eurprd04.prod.outlook.com (2603:10a6:800:346::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.10; Thu, 19 Nov
 2026 12:30:09 +0000
Received: from PA3PR04MB11153.eurprd04.prod.outlook.com
 ([fe80::6b02:c0eb:95a4:3c3d]) by PA3PR04MB11153.eurprd04.prod.outlook.com
 ([fe80::6b02:c0eb:95a4:3c3d%5]) with mapi id 15.21.0639.010; Thu, 19 Nov 2026
 12:30:09 +0000
Message-ID: <d0d4015f-507a-4713-814e-f7c18a197f15@cherry.de>
Date: Thu, 19 Nov 2026 13:30:07 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] tools/gen-releases-svg: use subprocess check_call
 instead of run
To: Antonin Godard <antonin.godard@bootlin.com>, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20261119-gen-releases-svg-fixes-v1-0-b6245fbf8294@bootlin.com>
 <20261119-gen-releases-svg-fixes-v1-1-b6245fbf8294@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20261119-gen-releases-svg-fixes-v1-1-b6245fbf8294@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VIUP296CA0117.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:350::19) To PA3PR04MB11153.eurprd04.prod.outlook.com
 (2603:10a6:102:4ab::7)
Return-Path: quentin.schulz@cherry.de
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA3PR04MB11153:EE_|VI0PR04MB12661:EE_
X-MS-Office365-Filtering-Correlation-Id: 7cfd028c-fb56-4112-10fb-08df4638d94a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|10070799003|1800799024|376014|23010399003|366016|10067099003|4143699003|11063799006|56012099006|261026121527099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: hayoaEZPUtm2/yFywXKlLCcn2u8FvzSac/Sr33D70xI2GFzbgn5D56Lfe0lTgF+xOGK1a8s2Wb5fua5fdpUSbWDcp4ZvxA24CtKDcFR1BJdPgROOG16Q11FZ3PBbYZkkX/X4RV7mErT5G/6UVqZQP8BHOgFGT489MJu8XtZk5wH4wMy7fzREk2Q090Rh94HghpouPp/Vl0kbpLSrjVz0IBG67Y42QlLlTRluhYvXFZK8V0uqYq/1+22stf+GlqLsxRxE8RBr+dmeXrpe0TvJTY0DWsEuWheoFJdjyZEYtN8ahALOGbiBgEC+ze6afuc8k2pEor+3lYffXonxZC1E4zELoNCSr1RPxD4d8THMZs21IFPwAmWr/vIKStknNhfYO0RhNiZxJzqNbwKmDMSlSLZrYitPMHw0OacSKG+xecM9VCoKqTC04C8eP4ZyLBjmtb94SNyPot1SIRmrSu0b8iKJCB27Sh26WW7oQO/Qj/sDwZ/sX3L1B5VqSxMQYDaap5RbuPaQILy7zJkfNEALQd3jpuwK2jSGiPz3S4lIPAfw5lx8OOz1QKO6aiBZOGVhNWyRMIFaXbDZQn61HIHLJMGRsgk7Y60qM8wPGBWuc3/iimx0yZPWwXRyBqkISVlO1VDhpJSkwLHGeIylnKk8pA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA3PR04MB11153.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(376014)(23010399003)(366016)(10067099003)(4143699003)(11063799006)(56012099006)(261026121527099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SUxwSTAvQzZJL1QwRjEweGVRT1E3cEtaL09mZkdoVWdEWmllZU5xSnNpOVRw?=
 =?utf-8?B?dGVBYzI1Y3I2ZFhKOWhodU90ZWpDSVVGUVlyL1BmTmVyWjFGTi9ncE5CdXJh?=
 =?utf-8?B?VWQyQTdHTlZxTzZZeHNpbVlmNzJNenR1MDdPWVZyVlpIUnM1ODFDK0hiMzZr?=
 =?utf-8?B?Q3k5YXV6YUdvdWRjbWsrN2l5bENOZGgyRC9EdHVlQzJZak85UXhuQVVpVXh0?=
 =?utf-8?B?NGs2VjkzZ3k5K3VqQkRBMFVZR0U3OUErREhkb2tjcjRodE9TckVWUVlLRDV0?=
 =?utf-8?B?WG9vVVBRdjBxazdmR1ZtbHRLVmVoNTJYZXY4YnN5UnpIOUNBZlBGb3l5bk9S?=
 =?utf-8?B?aDdpSmRRdDhLVlpQZSt1SjEyT3lsWnhTZzdYeUxWQ1lFb1dVU1B5akxuc3Fa?=
 =?utf-8?B?ZmhzMU9vdkFzdGlpRW1ZZkUzRHlRUlROd0UwM3A4U3Nwb3Mwc0ZwU0VLcEJ2?=
 =?utf-8?B?UWdwMVgzbHQzZlQ2TWlpbGkzTkJ0YnpPUGlFaXJtOTFsc0VMT1FFYWJCK1p3?=
 =?utf-8?B?NmNxSm8vQklGajZUTmtUQjZGNTV0K1Q5Mzg3YWhNWFdJVkZUSkhxdkVkQWRH?=
 =?utf-8?B?R0NIL0lJMDE4WFVpODMxVHc3MUh0cE9Dbjh1UEczek9qZk9MdFZDODMrOGZU?=
 =?utf-8?B?UGM4ZitwV25zVDlabXNiN01VYVBoOWoveWZsMnJGVTIrcTkzcTVDbWtnMUFW?=
 =?utf-8?B?Wkd0ZzZrZ2xDTHdsbFBuTEdOakNyRHVuTFM5UW1kamcvQTFvcHpCbTJ1UXZ4?=
 =?utf-8?B?T3JYUFludzRmVmhHWG5laEpHd0RMZWtlbERWdVc4bHI1emJrVVo1UE8vbnpi?=
 =?utf-8?B?ZGhKSUxGTmRFVzdLVkllQnF0SVJaWWVjellaNHl0VWhvOVRiUmJmMWxlNEZj?=
 =?utf-8?B?Ukt5NElGa3FHN1g2ZGdTQ0p0Mlg5S3kzU1lPdHVMRDY3dTFQcWhuQkRwbysr?=
 =?utf-8?B?bG5JK1BVV3kwcGNnSGZtbmlyT1VIcmtKRUlic1FMdG5sVVFzV0Q2MkREWkpH?=
 =?utf-8?B?cUlwZXg1d1FLdm9hZlo5a3dJWlZETVE5MkczOTZtMEI5Z3pKYklQcnl4cVVr?=
 =?utf-8?B?b1VvTkYvay9aQXJ6V1ZIRThFd3N3cVBCTHd0WmdsS0JnM0VhQSttQjE4WXJu?=
 =?utf-8?B?TEFqN3BlUWxTR2p2VW9nZHYyZDMremEwcjBTbi9KbGVmN09XZW1PcU8zbEM1?=
 =?utf-8?B?WEt2TjM3dVhRUVNCVmpkSHIzVmhqYmdJcG5MT2I0YzFDSHIxVUJndWZadm5K?=
 =?utf-8?B?amJWamNubzhkMEtNWk0xMERxNmJTM0FZNDR4S013THFBcWp0UjhMaDlTTE96?=
 =?utf-8?B?UlJRdVFldVhBNWRwclUzNFNydCtiTmJBaDJVN1BaZ0xwOEg5bktlQXZpdzJS?=
 =?utf-8?B?ZkhmWW8zd0lIMmxrUFh0eHFWUSt6UVZDb2x3Zm92Rnl0OVFQZEprTWRLbXVl?=
 =?utf-8?B?YjhvOUhRektlWDFwVWZGYXpsZ2xuVnk0YmM3VEhqNFE5ays3RjJ3WDVxQm9T?=
 =?utf-8?B?eG5HcHdDaG15dFI0Ym5Lc3BSd29ZNzlWb1JLb2NGcTZSbDk2d0NFdkxZaUtS?=
 =?utf-8?B?OWthUDV5VXNnYzQ0L2Y1USsxakpOZmU3UnhKellrVXFFNi9YajFYM1pucHN5?=
 =?utf-8?B?aEUwcjFJb2dpbVA4NUxZU2hGc1c5M1NBVEtuQnpVREQ3OGlNWCsxTXI5VWUy?=
 =?utf-8?B?L0tESE9zR0ZrZ3BWVHRPK21CMGpFU0pEaytNdHlvbFJiOUFRUUdCa1EwQkJO?=
 =?utf-8?B?dThNSnJFczIyeWFod21ocURJLzAxQWl1Vll4Ujl3OUxXb0tMb3A4YmRQd2tE?=
 =?utf-8?B?TXJsdVlNb1ZodmxxUlE0eWFadEhCV3ZWQjhPdEZmdExUZDh0KzA3a2N6bm9X?=
 =?utf-8?B?V3pteVhlMVBnSVZhaDVJTFVXYmZZTG9MWktvU0lPTm9Lc2c3clozNWVSQit3?=
 =?utf-8?B?dkV3RUFEckJQZ3lwQ3MyTEpmVjB0OS8yZDc4MjIvQWhZWjI5TEpvcDBJL01Z?=
 =?utf-8?B?azk4YkZkSENGY3YyOWFNTk51anZoWmlCTEVGNGpVS01EMC9Nb1I5UUtxRVBv?=
 =?utf-8?B?SUNqUTJyQnpDOXVMektZMVJuTlN3NU41UkoyRWtSVU1OaFhPKy91RmVwWnda?=
 =?utf-8?B?RVowQ3QxVndpYUtiSWx4ZEQ0ZTBZRFhTMTM0RlRudzZJT04yZUxORXZLakVG?=
 =?utf-8?B?UTJMYlVkb1crcXZEYUlFWFdsUHJnbFVKWXVQNk9PTUx6UVhQKzBKcFUvdmQw?=
 =?utf-8?B?QWNYZm43U1JPcHRYNUdUcFJQU1pxeWN2RHhsalM5cXFSSlF6YjhJZFBqME9s?=
 =?utf-8?B?YzFOSFQ1a1NGeitMajdRaHZ5NGxadWdyMG5PRUtvZXN4d0YxdUVWcE9ocFMz?=
 =?utf-8?Q?+MVjVtAMzwT8Z+TA52+acWI2SvE2u8LkFX8ogAZOfBqJi?=
X-MS-Exchange-AntiSpam-MessageData-1: KfTx0rWKtDWyuaacjQzK/Gac5l8JBtREJnY=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 7cfd028c-fb56-4112-10fb-08df4638d94a
X-MS-Exchange-CrossTenant-AuthSource: PA3PR04MB11153.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 12:30:08.9733
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QIWOIGQMycPK8ptjyt/GMAt+RFtdma2izlHELIf6L1o9N3/w2H6fA0tApNCcpH7Wy5mKWJ4gE4Sa/oa6QaTrbWWL6vIVOBShahZYJmDeiJ0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB12661
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <docs@lists.yoctoproject.org>; Thu, 19 Nov 2026 12:30:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10801

Hi Antonin,

On 11/19/26 8:55 AM, Antonin Godard wrote:
> We don't use the result of the command, so use check_call instead.
> 
> Suggested-by: Quentin Schulz <quentin.schulz@cherry.de>
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin
