Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C01B2E77184
	for <webhook@archiver.kernel.org>; Tue, 17 Dec 2024 14:14:38 +0000 (UTC)
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (EUR02-VI1-obe.outbound.protection.outlook.com [40.107.241.84])
 by mx.groups.io with SMTP id smtpd.web10.82368.1734444872754410147
 for <docs@lists.yoctoproject.org>;
 Tue, 17 Dec 2024 06:14:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=QsOmHXje;
 spf=pass (domain: cherry.de, ip: 40.107.241.84, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EGs8WZjPAdfPXOlRNjTe46yQ9h0SBNtsU0nVxwgLO7aVx9PwF+WY4bAZ8qAnqGb5rzQMe33ND+GSll3syyd7d7MyEDhmx+5ug2kJNaRb5/Zxn47ah4WdaItcVx7A2tIEsQoPbiANL9KEYS5P3Ztg+BTfrQy3IIfLiEOcw3+cXe+GM0HukuLD0Jp1mv4vD2Cf0z5EaQ52cxanQ/6IElhqXgm0s7FIRF4qg0M4Ilm+JCf32/x/Sn10AzUnedqeqA0YvlQU19uqH/u0O61IorhlWngkfNrvHXKVBOz/m04dHyGxxEP3+OWLgU2w82xY6jaCdxkjgcICft/AcSYj5gaGBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yp5RrORmw39YsCrHKti6VASjWKJE0bv9MDHiaITTsAw=;
 b=FtD8HQ5THOw3OpK73gZ6pkfC55fyeF5ZdXQ3vbdnkUxkNQAroArTshEMaRx/fvd8zz2044FB2cxDEsWypET5eJx2hnBMJFUh+6DzZKSl5IrUOCOd88C2wJYmhvScVG6RN8txKCSuoYt4gD3AczglerHNkfY6bI7+b0YT/GXonBimmW/Ra+3b1XpOLMNxzDokU9/2lMXAW7N9kbxckaGY1Y+J8JBKBcqP9Yviy1jTPojh/KBWgu6Xpc7/2cmNxwcNy1XxAv1iFF8KoAs5vQSGGPPrgq3aRNkLn/5hd9Rd8kwntlQlTIzuvMzMx5MR9M1suGTvLgkrFbK1EAQevQ6mBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yp5RrORmw39YsCrHKti6VASjWKJE0bv9MDHiaITTsAw=;
 b=QsOmHXjetguCV5RRtt9aWdz8REsg5kwnEqexWvL10N5pkmBlw53NN2D4BT+7i+oaz/6/aRjtSB17dVoRZQr0WdqzfsmRSW3vZSO1Wo+/AL0vdtFbL0V0wdF2L0tD5pQn/L7zbkhIhAIseNbX4dnPPzgVmDgUys6vxi4+9PYTtVk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by PA1PR04MB10745.eurprd04.prod.outlook.com (2603:10a6:102:489::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.12; Tue, 17 Dec
 2024 14:14:29 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%3]) with mapi id 15.20.8272.005; Tue, 17 Dec 2024
 14:14:29 +0000
Message-ID: <65a43bcb-a71b-4b47-8e4a-7c9feaef88e3@cherry.de>
Date: Tue, 17 Dec 2024 15:14:28 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [yocto-docs PATCH 10/14] ref-manual/variables: document
 the CHECKLAYER_REQUIRED_TESTS variable
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20241217-release-note-5-2-updates-v1-0-b189493b1b09@bootlin.com>
 <20241217-release-note-5-2-updates-v1-10-b189493b1b09@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20241217-release-note-5-2-updates-v1-10-b189493b1b09@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0178.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9f::7) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|PA1PR04MB10745:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c51abe0-514b-424a-273a-08dd1ea51ed6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?TzhOYzNTOGlkbkw5bFNTOEN4N0tRM2RxaDJVcGFMK1NiRDJoTVB4VkNhNENT?=
 =?utf-8?B?WUlEcjA0SDhsanBqUllCU2NmVzNkNXY5aG1MK0lrWjVsV3FlMnhxajdSWHlH?=
 =?utf-8?B?M3N0WDA4OUE0ckszYzFJVVNOTDA1K0k1ZUhuaHN1YzV5RnpJeC9nLzQram5Q?=
 =?utf-8?B?MXlBcDhuak45VWhQWTFDOTFsditicEF4eG5vdXVPcGhPQ1N0TjBIV2dVb2Vx?=
 =?utf-8?B?YWVUczJVcVQ3dmFkMHBOMWh5YzJmMTRKam1CeFlOZUJIUlNTMnpSZGxjWUVE?=
 =?utf-8?B?OUlxZnBCOEN1MzFwT254enQ2WmVHVldnNm4wSEhEa3BQZDBRTndmKzE3bUxS?=
 =?utf-8?B?WktkdGU4dHExOE5PSXcxcUtkbmQzS1RSY0xTNzBDcm5zREh4WlNxY1FFL0tx?=
 =?utf-8?B?cjdnMy92WDhZRCtSbGhrUUFGazhralpOVVVxOUtZNHMrVkpaZDk2Q0hGYTQ2?=
 =?utf-8?B?ekhSL3M3MHp5M2VoS2swWXlyVmdLNkJlcHprUXBMS2lPQlJCRXVQU2NINnRZ?=
 =?utf-8?B?QTkrTjdtYlIwd2doSWdlQ3N2VVA0Zk41My9Rb3IyQVVGODBNN3RrckZFSkVs?=
 =?utf-8?B?RjRLVDZLUUxhK0h6dGx2K2hhK0ZFSkpjZllLNzZHaHBTVDFGRFhSYzVCNCtm?=
 =?utf-8?B?N1M3aFVaK3Y2WjBqdVpwUEtXQy9YTVlpdlNxWThnNUs5ZXJReW8xVkpZbmRO?=
 =?utf-8?B?M2RUL1dLdEc2NU4vMkpDNU51WnJWcHFxWVlRRGcxWkhGcm1vSVI3UVdaeUlq?=
 =?utf-8?B?bmNnYlM4WldhOGtrOTd4enNPOHJ2amlrZlVDZHc1TStCWXRBNXVVYTNBUWdz?=
 =?utf-8?B?OUIzZzJaRDlpYUEyUWxlV1FWOGxBUXNYdm9sMW9wNE9rQ3pmNnFmbExiNEFi?=
 =?utf-8?B?OGN0b00zb20zWnFkQW9LVk9mRWhwSGRvNHB6TkoveVJPTkNhT1lWeUhSZnJH?=
 =?utf-8?B?TnhxSjRUa0R4Sm43aUhoeG5uMWxyU3ljbVh6QnJick1renRwdVNyZHBud0hY?=
 =?utf-8?B?Mlp6WHhuTGxrMHpUbGFYSnRKWHNXNHRzMnYrejlFeDZiaC85S0hORlBDYktp?=
 =?utf-8?B?Q091a0taYnVicVplZ3hYQS9OVm5CY2tWaEhjUnhqZzlqVm96OVo3Zjc4MmY1?=
 =?utf-8?B?b0lvOHAvNkpyYys3dXhWU2x5bW9ZcDJxR2JkSjJ5ZDIvdW4wTGNyYlRJNGV2?=
 =?utf-8?B?U21hSDllRzFCODBLcnFLUjFoSFUyYVlnb2NKMXRWVFcxejRlTnBLTmx1NnNa?=
 =?utf-8?B?RlZyY1hxN0taWGhoM3gxQmhjRGNVdFNlb1dqSXBMUTJQajlvci9ibkRHREpa?=
 =?utf-8?B?QlFOeGtVQjBMWm50UE00eG1QTHoybTh1cE16Tmo3T3BaQnkwZm1FdzVBNVBU?=
 =?utf-8?B?Vk1oNnJyZkM5TEk2dFRFT2UwT1lhSDFBTWdJUUFlT0U4V091SVl5Qy9xT0RE?=
 =?utf-8?B?ZzI5cFVsS3RyZmRqMCtUa1RwUnRGNzA2M01ySmhGb3JHbzlPUnM1ZitnYmdM?=
 =?utf-8?B?QzFPSzQ5TDhZWlFSTUdHVkhlakloWWliUU5qMUV2WVEremJiY3hxWjJTdStz?=
 =?utf-8?B?allKQk95TmdFMGlKOTBwUlNsaHdDYVZtMEYvdnRtMFkzVmhPV25lL2Y1aGdw?=
 =?utf-8?B?SW9TMDhvVklieTFPL0RyL2kyc1A0dk52YkswVk9hblRVTmIxcytTdTVocjJQ?=
 =?utf-8?B?ZnJHYk9ETnhCNkFHR0tUUGFLWUNEMklsNmlTOU5oODdNS2lRTmNiWFRrSVQ5?=
 =?utf-8?B?djdBcmpqSE5RU1JOWFJVbHpCU2pXOCswenNieXZKRGJYOWMrVVBlcGtIU2xD?=
 =?utf-8?B?Y2QvLzViRGd2ZDJtVlo2SVJkTXdveURMNTZGQ09QM2RPVGgvM296RlVpU2FO?=
 =?utf-8?Q?NX9hveBVPH09/?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?em5lRzhjVnNiSjJUZGJCNEFvOFB5dUlBOWdGRXBNakVvbDN4NnpwUWlhSU5W?=
 =?utf-8?B?L3NrZkk4b2k4K0k5aDZwRHNzRCtCek1scTFDQ2QrSGJPM1UzTkpLclVpbWVW?=
 =?utf-8?B?RFh6VVlNRTBBaXBzWEZvODJHMEVPTkxybncrTUlVdlhEUFAxUU9aZXVteGRD?=
 =?utf-8?B?U0tNbVhNVEswQ2tiVFVtNTVYYU1IOXA0cjR4M2R1dWJ2K3c0ak02STVCWUZa?=
 =?utf-8?B?c1U5QUR5MmwxTTg4dGRKb21TaW85STR1TFQza0tJMG94Q3d0QUQzdnExblhr?=
 =?utf-8?B?Z0x3TkpIclJQcy9MSkxmd1JkTXVLM2tJSklPeUdHMjlOOXRwZ3VlZlk5Nkgx?=
 =?utf-8?B?UTJZcjlvYXJjM3lnYTZuZ3pvQ0NVa1VjMWIwNUh0ZjRsbEp2UXlMeGwxcFUr?=
 =?utf-8?B?VThBa0loYURDTHFTT2dKcjRMZjJHM3dzK0N3OHFnZWxIVTFlNlZKb2FJQVlE?=
 =?utf-8?B?bU15ZkR4N2o3L2hmZldDT0tHVHlDYUo1SmRLZHJSME5kc2ovWDhUb2xOcFFE?=
 =?utf-8?B?TkljOVNSdTBxMTRwYkh5dUtQSk5VOGVIK0EyWjg2bTNZT0tlcXQzVm5Gb1lz?=
 =?utf-8?B?L281ZVNsYU4xNkFGSzhDMkVPeVhja2FRN2hxYi9lSUM4Nlc5emwwRVRsakl1?=
 =?utf-8?B?d01zSEFFRkpnYUoyYjN4ajNrT3c0d2NnUEowbWtjME5xZVFmMEdnZFhnUWNJ?=
 =?utf-8?B?YXUwV2N2RE82alo2VDgrblJVUjBMM29VbzRZUEtlak1wbEN1aktad3pmbjFo?=
 =?utf-8?B?RWNZSzF6U1prWGVvR2FNU3VTUGduaUJjYUxReE9ibVZsVXE2WE9EMWljL0xZ?=
 =?utf-8?B?SzJoN2VDa0Y5NXlLazNOVEFROXBKSnd1TEFiZnQ0MmljUU1yM21Wc2xWNS9P?=
 =?utf-8?B?cklTVmpjaVE0cEQ0R3FqeGgrWUdWa2s1ei9nVU1iNUpKNUVGcFpsam8xdGNu?=
 =?utf-8?B?MTMrT1poVEdES2xzUnQrUEtWbUczMVZoMzM5aWc1elYvdnY1OFFWZWxRUWFY?=
 =?utf-8?B?YVlWRFQyeHdDcnlQbDNGQ1ZnQkJGb3JaaW5tN2xvNjBvRHVmN0FoTzVDQVV3?=
 =?utf-8?B?K0U2RU1wN3lObkRhdXl3VFJjcU5ZQ09wMFo5QWVWQVVlNktLRXdOL3dxUW5N?=
 =?utf-8?B?a0U4WDFJM3A4M0pwM2pPWVFwTWxJZjE4dk1lYU5NaVVvYjN0Z1NwY1ZpZFhC?=
 =?utf-8?B?VjFXRE1UYW9yUDZFdjEydnQ0c1dRZXN1NUhjUEMvRVF4bVRvNzhYWkdBQTJa?=
 =?utf-8?B?RUd1NHMxS1BvaDFzMElUSVh4MkJZdmRsUG5tVGhSYUhVVE5CYi93RHE3RTFs?=
 =?utf-8?B?U1lId1dYNTlWV3ZsYzFpVmV0SHFGb2xPSUpKTmFJNDFkRkFqZUdPY2dJMzFT?=
 =?utf-8?B?cWlUNTNmeXEvd2pqZWJYYUJpL2dlcDV3YXRkZmNHY2dQdndaVFJTbnRxUDlX?=
 =?utf-8?B?OXAxeHdpSDVTbS9TTVJIY0hSQU1pN1hyVGNERmlmVXdmUm0vWGZBNS9rZWpY?=
 =?utf-8?B?RHo0L1dqWVVab2ZzQ1E5L1JnelVDK2hYWHZkRVhZQitTMVk5eDBIejk2M2Ni?=
 =?utf-8?B?MlpnSWNGazlwaCtuWTMvTW5HUWVVUnUxeGJUTy9TYmhuRVJuRTZRQ016UXQ0?=
 =?utf-8?B?SUx3d29vYkhBOWtndHNsRERmMVphcTRMZW5mQjcvalZtR1N3VWNrbTUvS1NM?=
 =?utf-8?B?UEwzUWxFV0NId2FlNmNQbWhMNFpnYllFSG8wejZSZVRNK2l6UVhvSklreTVi?=
 =?utf-8?B?NHcreUkvRnc5VC9GRUQ2ZVdOZjJjTHY5L3ZoSWNNMDdSY2ZZalBic3Q3YzUw?=
 =?utf-8?B?OE5OaHlvdTdUMmpVVDJDRCtaNzd6cFZNNTRhSCtkM1dXamtidGdES1hybEdp?=
 =?utf-8?B?MVhzMjVqdmtxKzQ1WVBwQ2tPMmxQZHFvR3dXU1FFK2RCV0tkNzUvNFF2T0Vw?=
 =?utf-8?B?V3RPNHp1MndSa1h3b2pPOFppbE51NTVPR1BReTRaK3oyUHdwWERleXFEOHVk?=
 =?utf-8?B?YnBXVmF4WGhFbkl4WVVpeWdQRHVKa0JSOGJvWVJhNVFmY2lFTjUzVkYrWWNu?=
 =?utf-8?B?MjVaOXpxWmFBbVpwTGFlWXd1Mk1oVnJ4eVJpNzNRRGhsaVNRS29QRGh6OVZm?=
 =?utf-8?B?Z3MwT2cyUGw2dmh2VU8vaTIwaGdrMHZ4VU5jaU1FaXRoNDZOczAwRVlxcTRH?=
 =?utf-8?B?WVE9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c51abe0-514b-424a-273a-08dd1ea51ed6
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2024 14:14:29.3529
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rUF7VwT8L5NKM9JAYTWVkshzRwQU228HPoE/N879wKV9tPVk1vmqWr/6e4sWT/810HhbrJ7HVzH2w2b9Mwe3R2i5LiMo/lmbXkQq9zy1Nzo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10745
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 17 Dec 2024 14:14:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5966

Hi Antonin,

On 12/17/24 10:27 AM, Antonin Godard via lists.yoctoproject.org wrote:
> This was introduced in oecore by commit
> ce2e42ace2d15fb6745437cf0a7f07d28398ca12 ("insane: Split ERROR_QA into
> CHECKLAYER_REQUIRED_TESTS").
> 
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
>   documentation/ref-manual/variables.rst | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
> index d54e1365fcf3dabd3868aa80089afda727b1415a..66ecece8b2658b304e17c9c4a1492e42a8a313d4 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -1251,6 +1251,13 @@ system and gives an overview of their function and contents.
>         -  :term:`BUILDSDK_CFLAGS` when building for
>            an SDK (i.e. ``nativesdk-``)
>   
> +   :term:`CHECKLAYER_REQUIRED_TESTS`
> +      The :term:`CHECKLAYER_REQUIRED_TESTS` variable lists the QA tests that are
> +      required to be enabled to pass the Yocto Project Compatible status for a
> +      layer. For more information on the Yocto Project Compatible status, see
> +      the :ref:`dev-manual/layers:Making Sure Your Layer is Compatible With
> +      Yocto Project` section of the Yocto Project Development Manual.
> +

I don't think anything prevents us from modifying this variable to 
"pass" the test. Maybe we should say that this is meant to be a 
read-only variable essentially? And that modifications to the variable 
may only be done with approval from Yocto TSC?

Otherwise, looks good to me.

Cheers,
Quentin

