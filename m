Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAA8DC4345F
	for <webhook@archiver.kernel.org>; Mon, 15 Apr 2024 10:11:46 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (EUR03-DBA-obe.outbound.protection.outlook.com [40.107.104.100])
 by mx.groups.io with SMTP id smtpd.web11.17590.1713175899001070624
 for <docs@lists.yoctoproject.org>;
 Mon, 15 Apr 2024 03:11:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@theobroma-systems.com header.s=selector1 header.b=aP0b/KHr;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.104.100, mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S0U4SR+DvlhmcTTbC8NzeMy5INsQgPY93hTBPFyWlOidEJ4mxYTaEWdWco5MDX3p06PKmTKdxldajdsf0pfigLF5qR3Lsk19GVLm8TLqgnBo5wIjJ4VBtau264N1DDZbn6hH+Cs5sbFX7qyyxgpNDY0EkYMhGY1bVL0judjX2XmX0X/t1P/r94Tlvp+v4noulmVZdeTxi9n9b+OBE5jvNaRtpVIw0vZZWLyoH29Ia/Y07KS3WPfwtwUx4DdfrkPj7x8ZINUb3pDn8MTHiaL4po59khjet0ChASvQvUP2+ausKWP5ZoW+QM4mRFovkOtEjyQaW8gbYXMQkuZH91OV3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wHIx9SVz9qhpgADdhAngH5ahO4OkVCkkCeNQSslzOMk=;
 b=HLCCfF5zZt4JoOELr+gFloxpnMomdnerd/Ojnjmz46FdV3Nodj+enD9x3T/Q2jT/G/uvtMQbSKu+c+NjZuiPkPbtUPhBVzgBdWTiaY7U8z9fiGyEw2GTjxKSdKjvCL4iqhuxq9BkpFxKpBG6MeIWSKc8Dkuo+vy/LXF3bJ+yCgcAI/g+np/yOPGJQ0KgheZnGBTXMa3XiZj1JoPvBceFViUGu2LMsIUa89Iu8Jz8KjZE1i8VUFCmvCjwhLax8MJJlPi4oFmIKgbAXKucm68g3HRdce01fSUpMQsi92VO9NP5s0u9ZI0z7cU9uw1g16sVXQ/oGEx0tK9RzBLHMB6nsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=theobroma-systems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wHIx9SVz9qhpgADdhAngH5ahO4OkVCkkCeNQSslzOMk=;
 b=aP0b/KHrXyXn1F1X2NaPmNCwrLGPjmzb/4F2IKOjkbS6piIosW1YEe3kiLVgSwY3jb6drhus+Yw18BCpfBoaTkJJfb5sD5LF77eu+t4/b6k9aSiXiLYye1mgnwrTmD1y3rK9uwaIR4yb5zdl76NQ/6sMw7JvE99LFxrMPTCVlrH4xg8khDpRBXkeViJiBs9SCLci9FyH6F1iNn/RI9+3i+qgpR5CGosWOjfZt/tt6FWKhEBVZZcaUUepPqPMNeBq3/oST+SHZrcSaL3/NeLds8MQ0HVFh9OqqP6bBfD0QPTOd+c4URag3LeckQfs+NXoe33aksjRUHjxipaXQPPCmw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from DB7PR04MB4842.eurprd04.prod.outlook.com (2603:10a6:10:1b::13)
 by DB8PR04MB6892.eurprd04.prod.outlook.com (2603:10a6:10:113::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Mon, 15 Apr
 2024 10:11:36 +0000
Received: from DB7PR04MB4842.eurprd04.prod.outlook.com
 ([fe80::bdc7:4b2c:e74e:1504]) by DB7PR04MB4842.eurprd04.prod.outlook.com
 ([fe80::bdc7:4b2c:e74e:1504%7]) with mapi id 15.20.7452.049; Mon, 15 Apr 2024
 10:11:36 +0000
Message-ID: <44ff31d4-4100-4f81-9421-6b8743ebbbdf@theobroma-systems.com>
Date: Mon, 15 Apr 2024 12:11:33 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC][PATCH] manuals: standards.md5: add standard for project
 names
To: michael.opdenacker@bootlin.com, docs@lists.yoctoproject.org
References: <20240415100555.1054695-1-michael.opdenacker@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <20240415100555.1054695-1-michael.opdenacker@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA1P291CA0020.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::24) To DB7PR04MB4842.eurprd04.prod.outlook.com
 (2603:10a6:10:1b::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB7PR04MB4842:EE_|DB8PR04MB6892:EE_
X-MS-Office365-Filtering-Correlation-Id: caeb14c4-6ac4-4a77-aaa3-08dc5d346ec0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	1yUeOXliwiziB/msk9gLaMhetN1eF2ahqW3wqgjV3Q6n3Nn2YC3doKSaJb1deiG62SpqL59UCKm5+OtpxZNLYkfj9zWHxNkeaLyZ6W/Dhe7M6BPuCRBm66DS5TBJrVDkynIko9k/YTrJOpkBCgcb63qBgKe35H+YPwAq/mabVD6uqBf2DGpJmTtrDdXAnLwn84u2H/cJleztONWxBC7GKEbn00NqCdWcZb/l1RaV+5ISufnYLj72jeLaQJXapxEtr0vBmfJwYqfEM8+fBXwT1+H5Fbe05pjpv7zu/IdMlNl9IqXYSn5iB5KNXXgFBYcAYkUNxOW4oZTlanwIzFledhocMv0L+E6x7gUP1p6/wc+lG0hF74hHZhm4wUrZQKWQEYovyWe45ncEPxQn0ptxeEAb/2EDN6JyZ2YgiRlHiARXgBlS133mah1ybYzhgL314Pcir7Kks+B+17vurbXchVBJvzgCCmGtJy998bZZBZqoiH7CFevrCj9XdDgtLZUENY2PCrTiW8GhmLE7Jb6tzvMIaYGbytVUZ25yNE4lxskPxpG3fiXIY0bmuTyuckgRg4Dyd0cX1G3v5OGcBuWHc17/D8+Kb8BrfzIsfaIPK6YzfoA+eIOVpBloDjzaC6CBt8WyjR0oY2yvUFkmw9C9gtT6I9GrVStMwlQBzAmTiWs=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR04MB4842.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(366007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?QVAzays5NG1ubW42emI5VEY1NHF4UVh4WGJmTFNrdlY0ZFBBejVyM1hBUFNx?=
 =?utf-8?B?WlpwSXUySDUxaGcyTHlrdVdxcjVySlpVSWM2bmlzcEM2Z3RFUXNJYUE1QVFZ?=
 =?utf-8?B?d3M0MTA1VFBnY3J5aU1WcEg4WWZhWklmMElCd2kwVlhNQlpQQWprbGlPRmxT?=
 =?utf-8?B?ZmUwcUhQaVRqWU0rQTBlQm5WOXBSR0JSKzJnR1ZZMXF2cXN3am1rV3dia2Fp?=
 =?utf-8?B?M0Fpdjk3RkM0M3JUUE1sQXJWMlV1RWNxNzdvdG9vUUExbXpvWGRBcmc2R2lm?=
 =?utf-8?B?OFNveDFDOUdONVRTUCswWU5NU2hpTHFxUUZqSU1iMjVUditncVpvc1p3ZEJI?=
 =?utf-8?B?NUwxYWllWXY2MFJmY1NiQ2lXUFc2djR5WUJSODExOGFpUnFQR1dTTkxSeE9X?=
 =?utf-8?B?djRuUCtwc0RCblZaQjhESktsR0NORW1kUHk0UHlZZEdqQ1g3VkNndFludVNq?=
 =?utf-8?B?Sm9SN0RKd0hab2xYTFVtZHo5SUtSdEs0Sm9YVXowMHNuTlh4OFBEeWd6T1Nr?=
 =?utf-8?B?RnBnbnFPZXB0MlRDTHdNVjh6dE95Rmt2dUhTbUVLTFRYV21YdzVjalN3YzdG?=
 =?utf-8?B?Rk44Nnh6T1k3SVhVUi9WVVFEZk40d2U2N0Q1cWJnRnRkVmRJMGVIbFI2VW1q?=
 =?utf-8?B?eTI2Y0o1ejRoWFFCYTZYQ0FneUwrVmI1NWd4N1pyYjBwMy9wcWI3M0t0M1JL?=
 =?utf-8?B?MUlXdjQzZDVGa2lxYU5wbUZjMW0wZWk0dXZBY3VzT3ZSaytzZWY0Sk1FcHo4?=
 =?utf-8?B?YTZndWd3aWdBQlUrcEpnS2E5TTE1SjZFUkNCaWV1OTJtcWo3QmRLbzBXajBo?=
 =?utf-8?B?YkNxNS9mVTVqUEtNL1VmZVZaZFN1WmU1MXRsalFMcWhzaHZxc2hlcHp0Q1lK?=
 =?utf-8?B?Y3BIYmN6RFBtMnJnWThXazljL2ZXMGRYSHNtUVZOTDZQQ0MrTEsvNFBHcEdj?=
 =?utf-8?B?V3dCU2pNWFU2MWFqMGRGaUUvKzYvZExCM09BYnp0RmpMSGROZ3lScGdndXZI?=
 =?utf-8?B?VFhRclJpdW1RUXNlNjhyLzgxbXEvTDMzMHZzQVdnL2svZmw5Vy94L2dSVEVN?=
 =?utf-8?B?VXVDV2M0Y2dpSk9ReFVpQzdhNUFKZXBmMWZiZWlMTk9UZCtRRldpeWI3WkMr?=
 =?utf-8?B?bTAvVVp3RGhLSWNJcGc5YkFCTXpzMDBxNGtEM3ZyZ0RkMzM1T0ttUUN1MXpH?=
 =?utf-8?B?emJVakNLbkxmNEd4UVU2eCt4R1lEazA4QmtScjZMT0JjWXF6ZmVod1B5d1dl?=
 =?utf-8?B?SGVYdzMvdXhNZk5sNElTU0t5ZFBoMnJtRTQxVXpuWXk1Wjl0SUwrdVVwczh0?=
 =?utf-8?B?VkF3RGdTU1NLOXFPbU5scklQdjhzbmtKTU5tOU91UmNmZlFIRDVPTFRVNmwx?=
 =?utf-8?B?Y1FwbTRlMFE3VlZSdXBLRkVkK0tsQ0hrcitCdFFraU9VamdlUGxnb1ZEVGZS?=
 =?utf-8?B?R05sTG1LOHVsdkVCZ0c3cXk3N2lYazM1eGtod25sd3VGRXUyUmNyK3N0ZHdE?=
 =?utf-8?B?M051N2c1NERUT3NGc0ZJTUdBcCtUSG8wcVVZWW11T0NVTkhiWUdKcWJjdnda?=
 =?utf-8?B?OVluSE1jdTlwdlMybllTdEt6TENUVGdyRFQvYWFYN1pMSTJoU3RTcU80R1Ri?=
 =?utf-8?B?ZFN1VkRSN1k5YzFhTFViSlBhTk1CWkpiTTNrUG9YU0t2N3dBdE9sQ0ZSMmRI?=
 =?utf-8?B?WFR4MkFpcTBJQkFPYnlOT3pTckhRRkVQeHRUbDViYm9jNUgyVU4vSDhoTzZw?=
 =?utf-8?B?ZklVVUZkWDRqc0JESTNNcFNqMTV2ZkpEZGJzSklCNGpTbGFmcVN1NU1JVks3?=
 =?utf-8?B?ZldUUGNTWDNFekoyTFlpSDFsSTEyYktkbkxnZ0VsOTdxSGhzK00rMXhTZmp0?=
 =?utf-8?B?NkdWTXFCbG1aRHhjYkVMUDdRVW5GQ2dKWk5TdWlaZG5HYUZlTkhackUwNGUx?=
 =?utf-8?B?TWlNcENqakZzOFM2cXFGYTFKTGp3RHJFOXlkWW8wMUJvclJyT2QybE5ndTZT?=
 =?utf-8?B?L2VROGwxQUVKbXJjanpHUDVEM1JDazY4bE1BV2ZCekN3VStvVTZtM2dkTVNN?=
 =?utf-8?B?cE04NG5JTXdaUXZxcUJwdUx1SjFLMnczTVVtemJqaEZMRTJtWUg3N2RYZXlF?=
 =?utf-8?B?cjd0RXJjVnRnVGoycE1KcTc0UFhkQ0RnR2VTZ25WYm45aTMwSFlCem9wNE1C?=
 =?utf-8?Q?YUaGIUERxO/sbo4YHwtZets=3D?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: caeb14c4-6ac4-4a77-aaa3-08dc5d346ec0
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB4842.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2024 10:11:35.9371
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9Wq5ciH3VyRxe3U/vFG2ngttGYs2avHR/jqvJYgCSUVjsogBrPbgXliakG0GqWyhJMQAlt2KVjSP9VQaz6jIdiW87rW0GZB7N/x+d5ltj0FvM+vSKqe4axLPfUIQ3Cxv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6892
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 15 Apr 2024 10:11:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5147

Hi Michael,

On 4/15/24 12:05, michael.opdenacker@bootlin.com wrote:
> From: Michael Opdenacker <michael.opdenacker@bootlin.com>
> 
> Set a new standard to introduce project names with single quotes,
> so that they appear in generated text with an italic font,
> to make them easier to distinguish from command names and from
> ordinary English words.
> 
> Rework and move the standard for command and file names
> to make the whole description "flow" better.
> 
> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
> CC: Quentin Schulz <quentin.schulz@theobroma-systems.com>
> ---
>   documentation/standards.md | 31 ++++++++++++++++---------------
>   1 file changed, 16 insertions(+), 15 deletions(-)
> 
> diff --git a/documentation/standards.md b/documentation/standards.md
> index e0c0cba83c..05c5afffe8 100644
> --- a/documentation/standards.md
> +++ b/documentation/standards.md
> @@ -70,27 +70,28 @@ cannot be split without infringing syntactic rules
>   or reducing readability, as well as for command output
>   which should be kept unmodified.
>   
> -### Project names
> +### File, tool and command names
>   
> -Project names should be capitalized in the same
> -way they are on Wikipedia, in particular:
> +File, tool, command and package names should be double tick-quoted.
> +For example, ``` ``conf/local.conf`` ``` is preferred over
> +`"conf/local.conf"`.
>   
> -* BitBake
> -* OpenEmbedded
> +### Project names
>   
> -There are exceptions in which such names can be used
> -in lower case:
> +Project names should be introduced with single quotes, to have them rendered
> +with an italic font and make them easier to distinguish from command names
> +(double tick-quoted) and from regular English words.
>   
> -* When referring to a package name
> -* When referring to the corresponding command name
> -* When used in a cross-reference title. Such
> -  titles are usually in lower case.
> +They should also be capitalized in the same way they are on Wikipedia, or on
> +their own project pages if they are not described on Wikipedia.
>   
> -### File, tool and command names
> +For example:
>   
> -File, tool and command names should be double tick-quoted.
> -For example, ``` ``conf/local.conf`` ``` is preferred over
> -`"conf/local.conf"`.
> +* ``` `BitBake` ```
> +* ``` `ftrace` ```
> +
> +An exception is when such names are used in a section title, or in a cross-reference
> +to a section. In that case, capitalization and quotes are ignored by Sphinx.
>   

Looks good to me but I'm wondering if we shouldn't have an exception for 
BitBake and Yocto Project? Those will be extensively used across the 
documentation and I think there shouldn't be too much confusing about 
the word (as opposed to some other programs which mean something in 
English for example, e.g. `perf`).

The idea behind this is that we'd then have an exception for those words 
in Vale and that would help us catch typos and have some kind of 
consistency across the documentation, without having to check manually.

Cheers,
Quentin

