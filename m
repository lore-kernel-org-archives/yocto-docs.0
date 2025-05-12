Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52B90C3ABC3
	for <webhook@archiver.kernel.org>; Mon, 12 May 2025 07:31:41 +0000 (UTC)
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (EUR02-DB5-obe.outbound.protection.outlook.com [40.107.249.49])
 by mx.groups.io with SMTP id smtpd.web11.44721.1747035092342007211
 for <docs@lists.yoctoproject.org>;
 Mon, 12 May 2025 00:31:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=dvcPxsd0;
 spf=pass (domain: cherry.de, ip: 40.107.249.49, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SUsy7YNBaWSJ0501JxmrF8ddoq7EcRs87eS9X7+jjvNOR8Y0XADjaLzVRUsKuZeyYgPX1qPpN8Peg3rjzuyFaGrcbq5PucgXn5AFM2e05NBpa/ll/ovbuUQQltUV0rBFL1cA0qzU0OT717lSwTlk1KQwj0mAqvw/zakmLoDaklYZzKtHv5JwD5mgpkUs3EP5c9RCSAb2uo8mNdZghNhCo3bPeoTbjwKPOLfXzVvrIjaa8K4fPu25eJbvHzPf6kjo4WmycwLE2HyQ/zj/o8KouvAfEbYHap4xpQd8c1ietspa7iIeJe/R+xsc+9Cy7bgULc809gWXvUbhZFcuk5CrAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nLMwY9Q96mU4P5hnz6ZvC5MK1MT0l2gB8wfrrvYJEwk=;
 b=Ninm63s/NKLAFaNz4N4WLzzbGBPvtVYZ6YLGjvRAx5r0BLFqZhu2uKbnBMax00j6WXzwPPujDbvLQcuU1gS+fR4oUHskr5glUEsWnbkPbeyrzLB5911PpC4eZe2gHPuKsvhylRDJAA2agVJ6F7jTtbqPGeVIrXGHszCozLD6ZEL6TgrZ1p1GUp9lyXcrcBZ9KAs48EqD0kdUbToiQVT7Oh6Ap9CHih2AdFFgY2TpaTUP3vwt3pBsSMIDCOOk2Gsio8lesI76J9VOLTIxQDk2fTa/Y9OdgWcsPrvj2lHNCzby2DkPqY7KQWrhrwi5LOCEdnsjbsbAyW6o6jnGtjd2jQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nLMwY9Q96mU4P5hnz6ZvC5MK1MT0l2gB8wfrrvYJEwk=;
 b=dvcPxsd0wERgmKzS1K9Yk38jvWcs/50XxxT2tECVSB9Pz21TtP0uz4Gwgz3NfTDbBqDwyBgc2QTOeAh8hwvZZdhV/nSyZk7jsZbXl8iFswD/lji9s2tHyaXjp6trMrpBpEPjVY13p7TrtBtmhhTL2vVdY/0OkUpyZ/32mH0EBeY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by DB9PR04MB9284.eurprd04.prod.outlook.com (2603:10a6:10:36c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.36; Mon, 12 May
 2025 07:31:28 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%4]) with mapi id 15.20.8722.027; Mon, 12 May 2025
 07:31:28 +0000
Message-ID: <8ebddc9e-300b-4e82-8ff7-20328f06d7a1@cherry.de>
Date: Mon, 12 May 2025 09:31:27 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH] ref-manual/variables.rst: document
 WIC_CREATE_EXTRA_ARGS
To: twoerner@gmail.com, docs@lists.yoctoproject.org
References: <20250506172300.19220-1-twoerner@gmail.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20250506172300.19220-1-twoerner@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2P291CA0007.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::10) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|DB9PR04MB9284:EE_
X-MS-Office365-Filtering-Correlation-Id: 808d91c8-286f-4829-1c71-08dd91270226
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?VG9CTnNHNXNJRE5PVEx4Zy9iRkxjeVlGY1IrbDU1bW1ScURnL3M0RWRvMS9V?=
 =?utf-8?B?cmdnNWNta1NMdW9BNWU2SC9zUVpCNnZNUWNOQWRpQzZBd0l4MHRtSERWenpZ?=
 =?utf-8?B?bkZ4MDE1UlNYbkt5N2xUZUxUWEttdlljUTdjVTEzTW5DdFBhYVFQWjZpTTVV?=
 =?utf-8?B?NXE3cU41OHNyZm1DZ20zNGlhNWlybWw4YzY0WFpSV0FXTWtEQlNVNU9uTnQ1?=
 =?utf-8?B?TVZjeHdQYWdyOHpnbXU1YVM1czU3TzM2emtvWmswTW9nRGJRSnY4NUhNdG1i?=
 =?utf-8?B?RkRDaGkvKzVTRE4wNUlDTzBYUGoyZVkvOWdYWVJtaUFWaTNmZnFVaUVvZ1RC?=
 =?utf-8?B?S2Zwd3hPdjhpWTBSS1R3bGZ2MDNzbkQrVjBYV1p3eDhNNkljOHliNXlUQ0hX?=
 =?utf-8?B?eXVJUFZFZVY5VjJXcUFKeEh0OUtTL0NZVTkrV3FzR0E2RmY4VVJCVWRubFFx?=
 =?utf-8?B?alBGNll6VHFVRHBXbzZEMTM0aEJ1cXcxM0RVVFRONWR3VmQxNWx4a1RNTnp1?=
 =?utf-8?B?Ym1vQnU1aisySGxwOUZFY3lZWUZxeUNnQlJDVmhNL0czWlBZbWc2VVRmZWNP?=
 =?utf-8?B?Z1ZQcWcvb25nR25iVkNHK2JDUUxZWTExbE5Od0RHSXVGdUxTM0hmc0lRc2Vw?=
 =?utf-8?B?a091b2pFM0toMTVRVmFBbUV0ZjNmdGxqaDhualRjSHN4K1lQK1QreGhzcDFP?=
 =?utf-8?B?R2pWTTN4VlByQVViTmxzQ3IwNTlOVTF0eTh6UDZiUXB3N1dob3ZhZGsxVndN?=
 =?utf-8?B?cE55SW9nM1BhVjdoUTZIVVJCaldreTRqaENIVFlVNDJOQTZ6UFdKZitCM1FI?=
 =?utf-8?B?RGRNeWxkcWxsS2x0RE02Nkwwc2tmQm5vUmc1WnhYVmV6VGEwd2JpNjF1b2Q4?=
 =?utf-8?B?K3E2MXhndjd3OUVydnlnZ2Rud1F4YnhlMVoySEdFMkd6NTI4aGFobmpIYUo1?=
 =?utf-8?B?NStoeDhlcHc4M0psRENpeGFoSFl0cmdiYWtwWkUvaVFjamFhRW9RT2JCUS9W?=
 =?utf-8?B?U0FqNDlYZDFsOFNzd0ZxaFM5aS95NGhIcVAxemYwQTZzRGN6dHNSUWcwZlZN?=
 =?utf-8?B?ZGtuWXlEQ0F2TG02MmhoVER3VjU1WHlQaW1DSzJndithYndaVVRlY2xEdGdv?=
 =?utf-8?B?Y0VRemt0OFV2WmtLOUlNeTgyRXRSYWxPRVU5Uk1vNjN0SUtLMFVlM1dKL0lC?=
 =?utf-8?B?eU95L3dNWjF4Sk9iZWZJOHdMdG9oT0dWaEdNcEUxMkswRm9kbHRWR1hudmtZ?=
 =?utf-8?B?RlFGbnZHVkdTbFByRG5NQnZYMGMvbEM0OElvQ21XQnhydjRLSzZBcmZUcmdI?=
 =?utf-8?B?aWVJVFNiSE1mdndYdVJ0ZUxEdVRZYkdzUnNzUWovSGNNb2dNM0ZCb2l5cmx6?=
 =?utf-8?B?VTJIRktMc2lPNWlwNjFPTVpJM2RRR0pMeHFDS2FPSEg3T0FsRTFzSEpueXJ5?=
 =?utf-8?B?NnhMUVFQQU14M2JyVldKY1VxbjRmeEVqVms0dllDNEZycDUyNEtsbzJMZFY2?=
 =?utf-8?B?bzl5WFFOaW5TaklwK1kxaXhxYThXeFNyUnJUYWE5cEVKOHNjc2hSUkxmaDM5?=
 =?utf-8?B?MUJ6VTBTUkpYVUtKUzRKQm12S1BDL1NwR0VQRzJ1QUVnVFlxSm5LTXlwcVFx?=
 =?utf-8?B?TzZ3ZnhjYUxnaFV0d2dVZWcwUVVuUythSnBFTVV1VlV1dzdYalhvTXV4YUNR?=
 =?utf-8?B?QTZYWHNEd1liM0JwU08wYmhFZGc3NjBZNWNpZGhINkU3eFZ2YmlJMHl2SEpL?=
 =?utf-8?B?Z2JWNTl5MzFBNlB3enphbVRuMFYyNUxqUzNRbTM1SGpYVG9obkdSNHU3WEE5?=
 =?utf-8?Q?t+b4nYwpjKmA6RA4yIbPS7BED7HxmFoqhzAwQ=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?TGxxb3lwck1PT2VvOEJoYWdQeU9hRnBlaFBVSVh3T092aFRrSkJZUTFUVUFQ?=
 =?utf-8?B?RjM3VmZ1UE9IYThGZkYvVlY0REc4Q2orV1U5Y2FtdStCTWMveU9oOEFGYTZk?=
 =?utf-8?B?cU94dzAvVEdnQ3F0K2Y1VHJkTmcxTFBLRmRhYiswczY0UFZBNVoxcTVGNkYz?=
 =?utf-8?B?VVpzNlY4aCsyZHhLODRBUS9WTUhnTy9WWDY4N0hRSFJ4VEsrdHo2eWJtZy9t?=
 =?utf-8?B?ajUxZlRZd09hQmJHQnM1dUhqT0JvcEt3c3l2bHdOcmJjbk4xQTBZeWcyRUl1?=
 =?utf-8?B?Qk5wcXc1YWhRaVNRMkFnZldDMWU3TEk3dTg4Mm13TmdwQ3FEeE8rZHVMNmF2?=
 =?utf-8?B?anBVb21XZldxVk4rdlJvRURtUnZBSVlTQXBGdm95b3VMT3czd241ZlB6Y1Vw?=
 =?utf-8?B?NE1RU0NJWTNSQTU4NHMwMXNYYUNNQkc0aXdSa2VrbUNnRnhGRkRZOXVsNG1x?=
 =?utf-8?B?TjFBamc1N3BCWGU4ZzNiYk5QZFhHVDRQQnFPTVlCb0RTZFpKVmtXVHAzR2Na?=
 =?utf-8?B?MkRtLzZYT2U5dE5NKzY4bEU3V2I4bVltcXlhRGt3TU51YU40cnRQajB2djNk?=
 =?utf-8?B?Z1lxRStTVGFxR0pST0tHeFl3U2hEN1RyeU5KV1p3aGJjd3NnSThTUDNnNHFN?=
 =?utf-8?B?MWx0QStycG1wZnRsWUdOMVNVaTNGeGM4eUZILzI1WkZiR2lxK2lHSTJXTEht?=
 =?utf-8?B?N3BoMTdYUm9QdENCNFhTSUVBWFp3dkdYTHpTWnR1eFRRcU5tN1VlUmNhaTRx?=
 =?utf-8?B?S3VEQW1oY3JZVnd1ZGN4b1h3WEZ5emRtcHdOY1RqeEtEdHVHVlladjJPNDQv?=
 =?utf-8?B?M1FPNGI5WGlSVExrcUE3QUhwQXJ2dWdiYmJGVXJnZlFZZndDbGxPRW1UV2xZ?=
 =?utf-8?B?a2dNK3ZvMm0zWFR4eXYycTgzOGRZdEswRENBZ2V5QkdoS1lrRDBEbVJNRU5x?=
 =?utf-8?B?eTIxWTVLaVRQOTRCM3lOUmFvQXhCczhnVzhCQ1VKSFk1bGtzRTRKaHl4YTJt?=
 =?utf-8?B?UkltcDFWR3FFb2d1d1hHUDlDU3VBRElzUEpmSWhWQU1DcUVrWTBvTzFKclQ3?=
 =?utf-8?B?dWhNWFVIVlZMbTJjVjlHTzREdTltMUpuQVJPTlVZVTU3YlNrdGdSTzE0dWNC?=
 =?utf-8?B?OXI1bmkxQ29aWno1RnI0aGIzMHpQSkEzb3JDM284eTZscWNWUEptcHlwUWZI?=
 =?utf-8?B?dDRCaU5nL0lKMzM0MDlyYnBHdGF1YTFkZnRJY0ltamljeDN2L1pCYlRwU2JY?=
 =?utf-8?B?RXNVQXFmK0RUTmNpUTk3QXc1cC9wZi92MDRwdHRTSS9EbzE4NnBqMU1mc2lK?=
 =?utf-8?B?eGNySmhEVWgyZDJoeWZOc2xlYkJKdi9qNnVtNUpkMHlQQ1E1TjNEazBOcWdl?=
 =?utf-8?B?MC9LUjF2UHpVTjREbFJRcWsyNTRMWjN4c3JtcFMzbEs5c2wrZmpZZG43NkJj?=
 =?utf-8?B?MG15elpUNURDcHREZngwSW5nNjRLaXdCUlFsdDQybEtaSlVLaS82SSs3WWU0?=
 =?utf-8?B?djliMkpUallVS3ZqOTUrK3h4SHZuWklvYlh4alV2L3g4Zjg0em5YZ1ZaTnM4?=
 =?utf-8?B?c2grcUVPNmIza2R1WFl3dGhycjMycCt1c2U1ejl5dVpLNlpmN0FoSEpJSEZt?=
 =?utf-8?B?NFNpOFp5SzVKaThORUo1WnhMRnZwQkFYM1RCQ1R2ZDZTR1RmRTFiYWFMK3hO?=
 =?utf-8?B?cGJDRzF4UHVVWlB1ZU0yNm93SVVsRDM4ZXRvOW9yYXp3cm5PcXNyU3VQUS9Z?=
 =?utf-8?B?MDNlTFROYjE2enVWTHJuRHFodzBIQVYxWTY0YmtPdWlvSXFIRW5uTXpHb3o5?=
 =?utf-8?B?U3lPWlI2RVZIdTFwejRoL0NwdUVaZ2tXcm4yZVZTTlQ4QksvcEZFNEErQjdC?=
 =?utf-8?B?VUJFVXVxSFdHSCtaamQ0ZVYyNjBUVVVibTg0TG5NMnpwa3ZlaCtOaGFydHZp?=
 =?utf-8?B?MEFrc1BPT21mWmlVNGdyRlhWVUZoTGQ0VmV1WGIrdkhYd2lXL25VeFF6NzFU?=
 =?utf-8?B?NXF5UDdPRkpvUzR1MTdQdENoTzU2cHVGQ0FWYThNL283QnRzYklpYWhQSElw?=
 =?utf-8?B?VmZNUm5ueTdLSmxpZkJ5TURSSkEzOHlMNHhTbnNzMW5SU214dlJ0UjBVd2FY?=
 =?utf-8?B?N20rM0xvZzd3cGFzdzd3L0p0UWhHQTIxR2tvUGN6MHpxTllKVXVxZmZCeFhQ?=
 =?utf-8?B?MVE9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 808d91c8-286f-4829-1c71-08dd91270226
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2025 07:31:28.4861
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zzVFHHIK5RPUUvvwBU5vuUsVBjbJMpNh3W6uTuu767kY4im+u7Yk0ZlH1SCApGSp8k+md7GhagTrfiaIa48hmlfuSSShacQEtUykyo/3Iww=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9284
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 12 May 2025 07:31:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6805

Hi Trevor,

On 5/6/25 7:23 PM, Trevor Woerner via lists.yoctoproject.org wrote:
> Fixes [YOCTO #15509]
> 
> Signed-off-by: Trevor Woerner <twoerner@gmail.com>
> ---
>   documentation/ref-manual/variables.rst | 18 ++++++++++++++++++
>   1 file changed, 18 insertions(+)
> 
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
> index d17f81036b7d..29f34f5b029d 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -10942,6 +10942,24 @@ system and gives an overview of their function and contents.
>         Specifies the timeout in seconds used by the ``watchdog-config`` recipe
>         and also by ``systemd`` during reboot. The default is 60 seconds.
>   
> +   :term:`WIC_CREATE_EXTRA_ARGS`
> +      If the :term:`IMAGE_FSTYPES` variable contains "wic", the build
> +      will generate a Wic image automatically when BitBake builds an

Maybe we could point Wic image to 
https://docs.yoctoproject.org/dev-manual/wic.html#creating-partitioned-images-using-wic?

> +      image recipe. As part of this process the Wic bbclass will call the

There's no wic bbclass. I think you meant to say image_types_wic 
bbclass? It would be nice to provide a :ref: there but we actually do 
not have the class explained yet so cannot do a 
:ref:`ref-classes-image_types_wic` like we could for image_types.

> +      "`wic create`" command. The `WIC_CREATE_EXTRA_ARGS` variable is
> +      appended to the internal "`wic create`" command to provide a
> +      mechanism for the user to supply extra arguments to the
> +      "`wic create`" command that is automatically run by BitBake.
> +

A bit too many

the "`wic create`" command

to my taste, can suggest:

To allow the user to supply extra arguments,
the `WIC_CREATE_EXTRA_ARGS` variable is
appended to the internal "`wic create`" command
that is automatically run by BitBake.

What do you think?

> +      One such useful purpose for this mechanism is to add the "-D|--debug"

-D (or --debug)

maybe? I believe this would otherwise break the search or not be crystal 
clear what the option is supposed to be.

Looks good to me otherwise,

Cheers,
Quentin

