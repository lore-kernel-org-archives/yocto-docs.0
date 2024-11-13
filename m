Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0CF1D462B4
	for <webhook@archiver.kernel.org>; Wed, 13 Nov 2024 14:36:51 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.80])
 by mx.groups.io with SMTP id smtpd.web10.13207.1731508607219380613
 for <docs@lists.yoctoproject.org>;
 Wed, 13 Nov 2024 06:36:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=aQWPswyC;
 spf=pass (domain: cherry.de, ip: 40.107.22.80, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lbzT0zaqZkTUEJ2NnZmgFcNABeI1fMxRWWr0mdW2hSYfVhuhkqZ/JR71VeYI70ZPW29oaVPEo5okXx5oDrJVZd2tHki32bVQpcamVdPoNeNpjRpjX7lpJ/scFiS5K+ykbNyOZKx2leh16agAcRWsFYVe3s7DZelU2lyc8XExXvLhkBhd9fKnax8wpwYZZxglUPBgrVAHGjC7H5YcQtXeNpEMXQCQGeEXloByAhjBByUr9RrzKoUjkCosYw6neyhqVI7vbzJBJpB+8fZC9x+WApwl0JLp6Eh7ghAlxgbIxdCzJhH1UPqpWFcAjAQgK3V9a6/mHpQ70z3YG+XyoaJlHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EhAJheEYm3tVoM5mogiLQWHAv2VWhwl/wppBNQc4AWk=;
 b=u9IGrV0zethrb8qfHdsTcOoz6Kde+sSQK/HOcMFulrmssMHz/aRvPnryfFZbTMAdVhXlF0VGHb0NdsOlMIvXohNzBDUqnts3S/Cub3XIUO0ShiAsTKOH7GgdqZRRedwlqg6CJtH/3T2suB1YneYcM9Si8xa8JZP9fwp73HXZA16bfAVBgT7sUvAQYIxVlTT0ucn4obkCJdmYp5igAJReu+Ufbnlv0QuV+Qx+h/d6R0Tq7igL2KdaQvbwBxGr4cSIHNVk4xQuoUtgQ0HvhSnq129j7VJFdZOOrfMCIxVDv2o69jE/S6ON/32JtMLpegSwz1IzvYJ3KY4IYzTpXCKmyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EhAJheEYm3tVoM5mogiLQWHAv2VWhwl/wppBNQc4AWk=;
 b=aQWPswyCBjKTfTAAMGsghcUOWux0jAazbosdDzSU0VuJIYsHo28r3znDwMpeFWkBJPCjV6F4mDR5vH0Tm/QueJzLPvz1BecsbigEmZZP7jej+dx7BZQNJfmiTHO+TvhzcXrV65kaCSU2DTXomZb4KwbopPQE2Qh1kWbAKQsA+DY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by AS8PR04MB8359.eurprd04.prod.outlook.com (2603:10a6:20b:3b3::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.28; Wed, 13 Nov
 2024 14:36:43 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%7]) with mapi id 15.20.8158.013; Wed, 13 Nov 2024
 14:36:43 +0000
Message-ID: <61655cbc-00c6-48f8-8a68-c40edbce0512@cherry.de>
Date: Wed, 13 Nov 2024 15:36:40 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [yocto-docs PATCH v3 2/2] dev-manual: document how to provide
 confs from layer.conf
To: Antonin Godard <antonin.godard@bootlin.com>, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20241113-layer-confs-v3-0-3a84b0eb2750@bootlin.com>
 <20241113-layer-confs-v3-2-3a84b0eb2750@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20241113-layer-confs-v3-2-3a84b0eb2750@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: VI1PR09CA0104.eurprd09.prod.outlook.com
 (2603:10a6:803:78::27) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|AS8PR04MB8359:EE_
X-MS-Office365-Filtering-Correlation-Id: 6556a5e8-01b6-4258-d1d7-08dd03f097b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|10070799003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?Y1NPM1NWb1ZVSlZYNWFKSHo2Z05peTVNQ1JOdlNURG5haEJoV2lnSWNNaHZG?=
 =?utf-8?B?UFhpZkMvV0xDQ0Z5a3REYTU4VmhPVVZrYnBOaTZUcmo5Ym5CYVl6WEtwY1BB?=
 =?utf-8?B?WHZqVW0xbWx0cTRzSjk4bTcvWHFneDFhZmE5L2lrQ09Ic1d6WFExMmR0ZW81?=
 =?utf-8?B?SGFLVTdVMExJczQ4ckRsN1E4RCtWZVp2cHRPZzNjcXkyb2hPams2bklQS2hL?=
 =?utf-8?B?ZnlhdWs1RzdPcURsQm1zRnpjMDFPcmxSbEZHS3A2Qm45WkZrV0hWdmdqTWNs?=
 =?utf-8?B?bVY3MWVGdUZwWm5vRHBTdlFpZFpTaHlDSEIzWktLZVA3MHRqNHBQVlZIS2NI?=
 =?utf-8?B?SUMzbVZkbW5aRWRTUlhQN2RkcTNJL29FTTQ1VFlDMjNUYjNkMGNvdjMyeS9T?=
 =?utf-8?B?RHN5REFkekxTUXJTTFR3dldYa1BpRk16RUhEdjJ1WVZRY1ZEa0VEcGs0dTFr?=
 =?utf-8?B?WGFHWE1oYk1HWEJQZkdmaGxUVTAwWUxZWjVjMG5pU1U1M1VUT1l6cGIvTkVl?=
 =?utf-8?B?WnNoUnZ5K3RyazU4UEhjSmdWRzkzakhWOUo1UGNwRTllTVBjUkRqL2p0UFo4?=
 =?utf-8?B?UkJzWGJsbHNhbXpvU2lxWUFWRElManpwTmZDUSttOWF0UU1IL004UTRmYnZm?=
 =?utf-8?B?SXYzN1FhOEpTZXYvSENzVEw2TnFsSy9BVk42WUdOSFF1S0lGbVlmZkpaRytJ?=
 =?utf-8?B?YjUvWnNGdHZiWk1LUGxkb05XV1ZqcVdsbWRSTGllUWNWYmh6ZCtTd2RaNXl4?=
 =?utf-8?B?eHhXMk5xM0ZyT0JOZUZRMytEdGtaRFJCY2g2d0ZoanBRL255cVNxL3VTZnZs?=
 =?utf-8?B?R2lLTSt2WjFHMGF6QTNBU0w3dU45N2lXYVg3NnJOL00wS0c3a0hneVB0K291?=
 =?utf-8?B?WGhrWEhiQlowUCt6bzdnT09oQ1BiZWxSdW5KZ0hkMjArSzQ2ZDBDTWV5N1pn?=
 =?utf-8?B?d2xWQ1l3dXpaVGpBRU9WSy85eFFNRW0zbUt3R05CMUZLOWY3M0J0UjN4Zjk3?=
 =?utf-8?B?RGhuUzE1cThCTGRzN2VpSXQwbkJ5Y3M1ek01TkxvSnQwUnZpeVRURXhjK2lL?=
 =?utf-8?B?VTQ4dFpob2ZveXl3MXRra0R0SnJXMjQ1WEdlL3ZNS3JpS0JZTFl3SUNCbFcy?=
 =?utf-8?B?MmZhNS9GMlh0VEh0amU2czVMREczY0JWNWRYKzFJTGoxZmVGbkV5SExBZUhX?=
 =?utf-8?B?NEhYVVpJbXk2cmgxcUtwWDdtajZaQzF6blJ0d2FRa1RrREF3anRzTWFydHJ6?=
 =?utf-8?B?MWV3aytqUzBrOVdhM2tnaW1jUFplNGdxMlJKNkNvMjhiUHdqY09zRG9SNWtZ?=
 =?utf-8?B?RDIwR1lLbDdac1ZtU21XaVRxZlRudDFlaGN4eHhVOVhjUS9VamxmejF4OEVC?=
 =?utf-8?B?QzUvTU5wY1BiNjY3b2ZteUFEVWtYaU9obmxVM1VaZnFNblpBUTEvRit4MVpD?=
 =?utf-8?B?R1lOWkFNc2hCeU1RMldYVW1XL1ZDZTZNZjNRd1BHaFRIMDIvRk5HNitKYmpq?=
 =?utf-8?B?NURYUjRLTURoZzE4WEZXdCs5Q3ZNcHN3S29oeEpUUnNmTmxBYUJ3V3FUNkk1?=
 =?utf-8?B?RFhVOTc0TzRFQnU0WWlsdlJqWEVJN1BidVdMbEszUzk4Sk95Nk1NOFg4aHkx?=
 =?utf-8?B?YTZUaDQ3dURQWjRSQjZuc3pXYTY5SW1XTzNRQnN5RW1CMmh2TnQzenNUSUsx?=
 =?utf-8?Q?B8Q7vJahum0UcTy6suQj?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Wkh0WjI1NWtscHV2bHBKSHRQTks4SEEvVm9yZFZTTXExTlpUZXdXdmE5NDFM?=
 =?utf-8?B?aFZPSTd2bDVJaFJ6U3BnUDVwTnBDTGFEYmJYYlFXUFpnMFFEMTU0bWcrUDRt?=
 =?utf-8?B?MGdKVGVQNkRBOFo0NmpBNEdEdUh4TExMaDhrbThiLzRmVjJTWHNJNlBWWTBG?=
 =?utf-8?B?TmdLU3VCc1NNYThIS2JGNHpVWUtNWEZsWEpwc0dkeUxmOG91a0FIRlhkZG4r?=
 =?utf-8?B?WVlPbk9Sb3c1c0g3RDU5NGhwTkprWGJzdlpISGJCN1FPVGgyczEvcU1ZRHlu?=
 =?utf-8?B?RnVlTlhvRUpQaVY1WmlUYTM0b2IxdXIveUtuRGdzWVdjNy9WRTNiM1c1WjlY?=
 =?utf-8?B?OHF4S2ZvZERsSVExZEE4ZmdrMnFKbVhFVUpvQ0N0UUZNd0NnUWovenJiejVU?=
 =?utf-8?B?TXo0SG9xY1A3cGtMcllrcXBad1lRUFlNKzJFdnZXdVlkY1c0TVllMlZ6Nm43?=
 =?utf-8?B?ekxZUHA0dHpiMnBVNE5Uamx2Nk9WMVJGRTFmWndkV01EMUFhdU04ZXh0Vzdx?=
 =?utf-8?B?QjE4WVB0RHh2OThDa1J4VDBrLzNNbG1lTU55bTNhM0oxRjJqSjc3Tm1uRGVp?=
 =?utf-8?B?TTgwd3lwbVJkTVNlbTRoUExNdzI2QnU1RTFVbGpvenFyMUtyVmRzQlhOVjlO?=
 =?utf-8?B?Z0hmSlN4SmhCYmg3RldmdkhBOWhneDdZZG1tQ1JLYU9BZHdxMkhSSWd4NW5l?=
 =?utf-8?B?VXZwY1F6NTl0L3VxenZZSE5PU0RreU00dW5DSXA2YVFicDFCWW13NUFrZDFU?=
 =?utf-8?B?dHk0SmtCOXVreVJ1MzliOURxT0RKZ0Jjbk9OcUdPZ3Y4bGw3dWZEYlNkT2hS?=
 =?utf-8?B?V1VhL0VSNWlNTkhPYllZempoZXgyWElqTXNjdGpaYnZEUEM4SWNjL2FNeXU0?=
 =?utf-8?B?WE52eE40RnVKQ0V2eDhuUURpK3FvOVp5a2EvalJwWnZnUUVramx1NUFPVFVW?=
 =?utf-8?B?VC82d2FaWWNXbHBHN1llejhqZ0htdzIxcjJvU3VVOEltMFk0OVVVZkRyWWF0?=
 =?utf-8?B?dEhZcGZvU3kwaHVzVzVmOWd4RTE2OFZ4b2d6OGxFbVpUdTFJTWREQWN2WDNm?=
 =?utf-8?B?a29RalJaYlVnQnFqQW82OW9IVnkzNU9XczhsL3IrNDBmVTJRUFArZFhyS2kz?=
 =?utf-8?B?VVczYXgxNGdaRTB2UDFDdXpqdW9wQ3BMampYMzliMEVCd3NUbXdrUHhrc3M2?=
 =?utf-8?B?ZjlLNXZFQ0w1M2JqR0dqeFhvbE1SZFl5UjdaL1llUmgzeE9zbVJhNis3R09Z?=
 =?utf-8?B?SzlmMCtmN1VzQ3pqNHpHTExpTEVEN21VekdoeEVHcFZFQy9qQk1tR3BtaHp0?=
 =?utf-8?B?WDVYc0xlWkVsWnkyeGtiRWJ1WGpuRjdURHhBbVhFcW9vbGhYTWE3RDQveGF3?=
 =?utf-8?B?djRna3NWRlJYeG1DT1VvYm4vWGYrdXBBQjUxd3V4aDRuUGdiRDE2ZjhwVEpr?=
 =?utf-8?B?UUhDeWdxZ3FNK3dKeGIvc0FoSlAwcDI3K0J3bG0wU0xLVEs2Y3BZQjA3cVdJ?=
 =?utf-8?B?MmpMTytDRkxpOE0wR3pWTm1KRVpjcmYrT0kxVlZ0MUNJU1h5SUhEN0I1ZitO?=
 =?utf-8?B?QU5nV3JTV3VpU0lXc3JXdzdQUTQyTVhzMFNQWTBuWWh2WFZmd25rek1BZjFK?=
 =?utf-8?B?ZjBwMVZWcFBtVmlMQVI1OHU3V3ZDZkZVK2cweU5ZaTRETHd6OUZTbGFRZklx?=
 =?utf-8?B?ejlUbGxtWlZSdWlMeGFNM1VUSEZ6cDUzZ0x2UnRGbjBubmZmd2hWK08zZG9S?=
 =?utf-8?B?T0NjcVU4dDdncXBVRDB0bllScWFwcUVBZ05rRHZoTE00S2VjR0dEcEtaNThU?=
 =?utf-8?B?TG00OUJXeXphOWcxSlM4VFZ0OHcyM0VLb2ZoVTN2N1NrUVZvVnhqMW9PY3ZS?=
 =?utf-8?B?eVFGN0UzQ29NYUVaTDQ3aHBVY3o0M3B4WkxJQjd2L2VmZzNRV0g4OGVRcU84?=
 =?utf-8?B?OUlURHJCVDdkMXZqOGQveWdGc0hQRHlMaHJ1TG0xT1JSRUlJZ3VzMTUxdGda?=
 =?utf-8?B?SG9hOEMzMzFxRm4vaCtXa3FKcEpMZjNMN3NiY2hieCt1VE52aU5oQnVrVS9H?=
 =?utf-8?B?UGZHZDFOZXQ3Mnd3SDhHdVgzbEpBN3RadldOYndoUXF6NjFMZjdPZmRwc2M1?=
 =?utf-8?B?Y1JuajBpL2tsRndSQnJlTzlISGNqMEMwVVhPeGZyRUQ4ZVlCR1QrbjBaTFdI?=
 =?utf-8?Q?lFwLz6s/CQBgzOh0cCNYG6U=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 6556a5e8-01b6-4258-d1d7-08dd03f097b8
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2024 14:36:43.0282
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q1qCSfX/khqG5tMAxPSHowwJqP03WbRPW/FY1/cLPktA6TjV++frTBvLcAz8bhsh6cmbv3INZbEu+ixi2O9yjSWVAc1cTNciKqPc8hScH7c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8359
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 13 Nov 2024 14:36:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5734

Hi Antonin,

On 11/13/24 3:30 PM, Antonin Godard wrote:
> Add a section on providing global level configuration from the
> layer.conf file. Since this file is parsed at an earlier stage in the
> parsing process, it's not possible to combine bb.utils.contains and
> {DISTRO,MACHINE}_FEATURES to conditionally set some configurations.
> 
> This patch documents:
> 
> - First that this file can be used for providing such configuration.
> - Then demonstrate how to conditionally provide them, using a technique
>    that is currently used in meta-virtualization
>    (https://git.yoctoproject.org/meta-virtualization/tree/conf/layer.conf#n50).
> 
> Fixes [YOCTO #12688].
> 
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
>   documentation/dev-manual/layers.rst | 90 +++++++++++++++++++++++++++++++++++++
>   1 file changed, 90 insertions(+)
> 
> diff --git a/documentation/dev-manual/layers.rst b/documentation/dev-manual/layers.rst
> index 91889bd0ae391c7b6e62068778ae5c180c840762..ac18321b04d08bceae63672cf6da26660646fc59 100644
> --- a/documentation/dev-manual/layers.rst
> +++ b/documentation/dev-manual/layers.rst
> @@ -644,6 +644,96 @@ variable and append the layer's root name::
>      order of ``.conf`` or ``.bbclass`` files. Future versions of BitBake
>      might address this.
>   
> +Providing Global-level Configurations With Your Layer
> +-----------------------------------------------------
> +
> +When creating a layer, you may need to define configurations that should take
> +effect globally in your build environment when the layer is part of the build.
> +The ``layer.conf`` file is a :term:`configuration file` that affects the build
> +system globally, so it is a candidate for this use-case.
> +
> +.. warning::
> +
> +   Providing unconditional global level configuration from the ``layer.conf``
> +   file is *not* a good practice, and should be avoided. For this reason, the
> +   section :ref:`ref-conditional-layer-confs` below shows how the ``layer.conf``
> +   file can be used to provide configurations only if a certain condition is
> +   met.
> +
> +For example, if your layer provides a Linux kernel recipe named
> +``linux-custom``, you may want to make :term:`PREFERRED_PROVIDER_virtual/kernel
> +<PREFERRED_PROVIDER>` point to ``linux-custom``::
> +
> +  PREFERRED_PROVIDER_virtual/kernel = "linux-custom"
> +
> +This can be defined in the ``layer.conf`` file. If your layer is at the last
> +position in the :term:`BBLAYERS` list, it will take precedence over previous
> +``PREFERRED_PROVIDER_virtual/kernel`` assignments (unless it is set from a

s/unless it/unless one/

The issue is we have two "it" in that sentence, one for representing the 
layer and the other the PREFERRED_PROVIDER_virtual/kernel assignment. 
What's a bit confusing is that "it" should be understood as *an* 
assignment whereas the word is in its plural form before.

> +:term:`configuration file` that is parsed later, such as machine or distro
> +configuration files).
> +
> +.. _ref-conditional-layer-confs:
> +
> +Conditionally Provide Global-level Configurations With Your Layer
> +^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> +
> +In some cases, your layer may provide global configurations only if some
> +features it provides are enabled. Since the ``layer.conf`` file is parsed at an
> +earlier stage in the parsing process, the :term:`DISTRO_FEATURES` and
> +:term:`MACHINE_FEATURES` variables are not yet available to ``layer.conf``, and
> +declaring conditional assignments based on these variables is not possible. The
> +following technique shows a way to bypass this limitation by using the
> +:term:`USER_CLASSES` variable and a conditional ``include`` command.
> +
> +In the following steps, let's assume our layer is named ``meta-mylayer`` and
> +that this layer defines a custom :ref:`distro feature <ref-features-distro>`
> +named ``mylayer-kernel``. We will set the :term:`PREFERRED_PROVIDER` variable
> +for the kernel only if our feature ``mylayer-kernel`` is part of the
> +:term:`DISTRO_FEATURES`:
> +
> +#. Create an include file in the directory
> +   ``meta-mylayer/conf/distro/include/``, for example a file named
> +   ``mylayer-kernel-provider.inc`` that sets the kernel provider to
> +   ``linux-custom``::
> +
> +      PREFERRED_PROVIDER_virtual/kernel = "linux-custom"
> +
> +#. Provide a path to this include file in your ``layer.conf``::
> +
> +      META_MYLAYER_KERNEL_PROVIDER_PATH = "${LAYERDIR}/conf/distro/include/mylayer-kernel-provider.inc"
> +
> +#. Create a new class in ``meta-mylayer/classes-global/``, for example a class
> +   ``meta-mylayer-cfg.bbclass``. Make it conditionally include the file
> +   ``mylayer-kernel-provider.inc`` defined above, using the variable
> +   ``META_MYLAYER_KERNEL_PROVIDER_PATH`` defined in ``layer.conf``::
> +
> +      require ${@bb.utils.contains('DISTRO_FEATURES', 'mylayer-kernel', '${META_MYLAYER_KERNEL_PROVIDER_PATH}', '', d)}
> +
> +   For details on the ``bb.utils.contains`` function, see its definition in
> +   :bitbake_git:`lib/bb/utils.py </tree/lib/bb/utils.py>`.
> +
> +   .. note::
> +
> +      The ``require`` command is designed to not fail if the function
> +      ``bb.utils.contains`` returns an empty string.
> +
> +#. Back to your ``layer.conf`` file, add the class ``meta-mylayer-cfg`` class to
> +   the :term:`USER_CLASSES` variable::
> +
> +      USER_CLASSES:append = " meta-mylayer-cfg"
> +
> +   This will add the class ``meta-mylayer-cfg`` to the list of classes to
> +   globally inherit. Since the ``include`` command is conditional in

s/include/require/

We changed include for require in v2 I believe, we probably forgot to 
update that one as well :)

> +   ``meta-mylayer-cfg.bbclass``, even though inherited the class will have no
> +   effect until the feature ``mylayer-kernel`` is enabled through

s/until/unless/ ?

With the s/include/require/:

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

