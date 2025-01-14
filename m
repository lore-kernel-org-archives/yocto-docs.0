Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1A63E77188
	for <webhook@archiver.kernel.org>; Tue, 14 Jan 2025 09:11:23 +0000 (UTC)
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (EUR02-DB5-obe.outbound.protection.outlook.com [40.107.249.60])
 by mx.groups.io with SMTP id smtpd.web10.40494.1736845874621210167
 for <docs@lists.yoctoproject.org>;
 Tue, 14 Jan 2025 01:11:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=O4TITzx3;
 spf=pass (domain: cherry.de, ip: 40.107.249.60, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oPdQok/KwSOHqBuHk1+GzFpIIdHY2VUD0fBnKtQfW+BpgtE8L1naesNKp2j722hd9VHLjNJaHPdY9tpjSN7nCEqoUE8e4QTN7uj3Qokd3ODriZzPWtRmHc00dkv+z8pJcOauEAYdA7QNqX5fdgk2RBmAK/4+LgFrPWN53j96wbkEI96FSnrD2iJslDjAJMKHy1zRwMEBKHc3oaUfw5EB2zXCwe/GL5VA0DhoeA4wDenKAG1/DAAGwvuoZxQR7BZSLrLOLE5/kenq+volieJJ3G3LgUp6WFAclT7v95wDt8Klb86PqT1BACZn+ihi5/rmscbGDv+RLRoBTc0eKueJqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IvljeRrCcJuwMsbOFdraz+NlPIMxyWVjejH7KP2ggNM=;
 b=mvib6bf6ivc88WHZWQEaBt5bDN83s+OsYJcTgOaooIfaq7ZZVvq8L/n9VAS6UQoiUOrtEuOtvarDLbkKAdGeovrzov/mXsz2hnC5Nhq1sw2//TvSKe+sMVIzpTvapD1NetKHHE3Oe2LEEW1jUp0Y1e9kBMmH3nQTc7bzkrYw2kNTWKxCpx8PCgU7wv8UVYIdSrOdojEEAqaJB06lKe8AWwF4IkqlDTHCkbeApQjALlR2U2IvsmaD9uJSWmCUOOiRXbZ1mdnMtJzm/sdNhXiI6Vzrpp9/nnNPjEsVJURBXkQLqGX5assgIqEfL8j6eEIEs5zPUGEcX5U5ud6hF/ZXpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IvljeRrCcJuwMsbOFdraz+NlPIMxyWVjejH7KP2ggNM=;
 b=O4TITzx3mbkrWaVN5w+fhCfc4AQv6opufn+IDp0sNhF9pt3iPASyQmrQLZik3kuCWS+whPy8TTjgSjPEvHa5qQE4fLdzCku2Hi5LK4glOtrJQu0s+eLYFdInxK/RZplO1JdTZv9b4Hi+LGZDRhu8aZT1V+rVkuBlKm7p7XBO88s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by AM0PR04MB7060.eurprd04.prod.outlook.com (2603:10a6:208:196::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.19; Tue, 14 Jan
 2025 09:11:11 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%3]) with mapi id 15.20.8335.015; Tue, 14 Jan 2025
 09:11:11 +0000
Message-ID: <bdbdaed6-415f-4f67-8fd8-52cf90608104@cherry.de>
Date: Tue, 14 Jan 2025 10:11:10 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [yocto-docs][PATCH] dev-manual/building: document the
 initramfs-framework recipe
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Alejandro <alejandro@enedino.org>
References: <20250103-initramfs-framework-v1-1-bfc2cf950842@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20250103-initramfs-framework-v1-1-bfc2cf950842@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: FR3P281CA0203.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a5::11) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|AM0PR04MB7060:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a639f77-79ba-48a9-85fc-08dd347b63c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?M3M4cGVHN21WLzMyVG43WGFUN2VET3poUUtEdVJSRnpaRHV5TGRzNmx5dGxp?=
 =?utf-8?B?NDllbWhMZWcxTk03dFZHdDhQWDNrZWNXSE5tNkFYUTl2UEhnc1F3TlFvaTJV?=
 =?utf-8?B?T2VadnpoM1VxWTVEOFE3bXNKR2NUTnVJaTRSaXo3a0w1anFjQW5RQzlZUk95?=
 =?utf-8?B?N1p2cVppbTI2TE9tU014QW1nQ0Z6YndGbTM3MVhRc2graThiWmVORDRYSUhI?=
 =?utf-8?B?aXZwd01FcGNjYVl0S0RzblR3TThLeEptS0VVZHJNOXR0c1dMeEtSYTZwaWlR?=
 =?utf-8?B?Ui9JQjhQaUpObGhXK3ZuU3hmUUV0Vi9MdlYrQ2Y0eUVDVEViT205c0pXK0ky?=
 =?utf-8?B?WnhzSVg2NWRkcWpVR2d3NW90NTkzcVV5NUk2R2pHK2p0aSt1UjZLSXROZUxK?=
 =?utf-8?B?UzJwdHdwVmZ1eDBmeFVBRzNCVVJEaGxEait2Ykhmcll4dHRuRVN2MTRPby9S?=
 =?utf-8?B?dUdvT0tjajdlMXZsWGxOc3RDVXI3NUQwUWdWdnNPbElMcWY5RjBDMjRNRFUv?=
 =?utf-8?B?MXYrakl4RTdUYnBEdEJvQm52dVE4NUdLaTQ3d1dTcWE2OWRnRU1UbUF2TUd0?=
 =?utf-8?B?MkQ0amlVMHc1V0RlYVhpQjBVK0N0ME4vcjJxbjNSVklHQ08ramJoaE0rNUxu?=
 =?utf-8?B?eUxHNUxpcTdlRStJdm1aL0c5NGF5Ym93aGIzMHo3dkNSamNuNUl6Q01RckpF?=
 =?utf-8?B?ZXNKeWV0NlJ3dUxjclFVWXg3aWgvL3JWUm0vdGxlNVRWdDJPWmFJWFNOQXNv?=
 =?utf-8?B?NDR2NkFuOWRxdjB5Z1pPeWFqN2FZZE1ERVVCdXFsOXJIem1Nb2JBVG1oMFox?=
 =?utf-8?B?ek0xa1hlVWZ1R2V3R3YvZ2srSFk2L3Q0aDg4eEtucGIzVDU2OVZnVVhmSXUr?=
 =?utf-8?B?cmo3YWlKVlp2cHNGdHpuNkNsckM3eTl3R3VCSkZqRTUwMUJISGlVWGdUUXp5?=
 =?utf-8?B?V0Q4N2xjcGRNMUFtZktjcys4T3VFMXZTSTlFSlVnOCtZUG5IblYwbW5FS0V1?=
 =?utf-8?B?L0sxSmE0UFNLa2w0ZFNoMm5NdjlLWkdOWG56Z1ZHREdrUlRPN0ZrWUNaUjRR?=
 =?utf-8?B?MVEzY21EU2JoTjBHUFJvWW5lcm1mUGFtRGJpWVBycVlPdW5KdzFyVEJ5TnRp?=
 =?utf-8?B?ZlRieXg1b01pb3ZuZHdQSmUzMTJHREYrYlIwQ0FWU3RGL0JNMjdyUDZUTmtm?=
 =?utf-8?B?VjRpcmthaHRYcjBKWUttVTlEV2Yrbk0xTS90eVIwZzljWUVyeFJ0d0FDQUhl?=
 =?utf-8?B?UWVTMVFpYmt5N0pQdys0QVo1MCtYL2VzVHBPWjF6TlZXM25LL3lrSDVPci96?=
 =?utf-8?B?eWRnZDcrZ1FxYmxPKy9BaEJ5QUY2Qy9IVWFPUXNvQlNiWUNMZDA3RnpxY0g3?=
 =?utf-8?B?UDFkeGtPK0l2dTh0Z25UTW5XWGViRXVqQ0Z6NHlrQ1pRVXpXTTliN1F6bldv?=
 =?utf-8?B?T0ZxRUhGVkZVdXpaN2tMdHBwbXJ1TkFMc3FudWpQd1NDMmVLd2dCK3JZVmFO?=
 =?utf-8?B?TitkbnVJOWlWakdPSVBVbE1LVy83T3p1VmtNUzN6cDI3dFBIVVJod0FtRVlF?=
 =?utf-8?B?ZDk0LzU2MmQ1NitYSTZRV0Z5ZUtRZXp6aDlMZ0VMYlllTmFzQmxGZE16ZUUw?=
 =?utf-8?B?eVVUMlNIdVdhUDErK1pqZlF5a0lXV2c1VSt4MDRMUjlVUVd6SDRrMVVEb3pW?=
 =?utf-8?B?VXRRNi84d2U1aHd2UGIzcXVmWlFETUVMNVlyN1pEZXQ1cEhJU1hjSTk3OVRD?=
 =?utf-8?B?U3ljQkRYK1VMOHBaWWVCbGFoU3lPZjhXS0JGM3JERmdGQzFUaHBaMXhWOEJh?=
 =?utf-8?B?VVV5NVBGa2hLOHhjSWFKUT09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?OEJVNHoyN1BxakduZS8wM29vRGhvanVQeUJIeGZPT2c5dXpBOTVpU0hUU2Qv?=
 =?utf-8?B?c1k5NFVIcWdjZ09Oc2QvUm1DdWZrTDhJbEV2Y1hjOURNdkVvdVNFeGdLU01U?=
 =?utf-8?B?RHFQZ2krQ1ZObHp3U1FMem1BMzVTZllsOVRWRXkxYTVkZHE3Tk0rczkzUDRa?=
 =?utf-8?B?UHUrOU5kTVhRSGtScmdVcUQwMElLMGNRMEt3VlBWL1puT3dZOGRaQTJqZnBh?=
 =?utf-8?B?YXNVZW9kSGdzQVJwUUxtdHNSWEhJSXFRWXAyVG0wQzZqTUg2bVo1R1RaODN0?=
 =?utf-8?B?bTVBWm4xYWJmeEFkSHo3a0JnYnByVFZKQ3ZBNnQzcVFNcXpvTHkvOUlJUjFD?=
 =?utf-8?B?TnFUcE83V2FkYWpSWWxmaG9hRjkvZTV1QjRhdVZQMVorSUJHSU5Hd3lON1pL?=
 =?utf-8?B?ZkFQQmhVMGJDenVQZWVPY0ZJb2ZocTJRQUREYUk1SGpFUGZtc1d1enZOeE1H?=
 =?utf-8?B?Rkpxc3Y1d2FNaS9RWGJVam4vR2k5UENma0xLV09ia1RDaHVIelZvZW0yR3BQ?=
 =?utf-8?B?OEl6Yi9zSFovblRieUdHaXhlV1VPaldpdy8xbnFkNFMvY3RvbTV3RE9NVi9z?=
 =?utf-8?B?dUREWmFMM0xMZ2Z5ckV4Y2hjdWVLRjN3UmFJc3NUSmM4UXVnQnVxcXJweWlm?=
 =?utf-8?B?Tm5qa0Z1ejBqTCtGSWRRbVhLY3hoa3BMdHIzYVoxMFUxakZJMzVCOTRKS2k2?=
 =?utf-8?B?UURYSDNQOUx5RWhobHB2TkZrRy8zWnNPUnlzTjVyVWZITG12QnZEQXMyZXVW?=
 =?utf-8?B?UE44ZDFyMGNLTDJaSlNJNjdYb05UV3ErSGpJSkZ6ZFN1TFM3cXFWM1hsOUkr?=
 =?utf-8?B?UG1qeGtpZ0N1bGZNQ2hwdFZSczFSRG1nZm1VV1JoeENIaVU2aXcwWFlsb2Ru?=
 =?utf-8?B?WTByR0hSYnM2MHJoaWk5WnVsV2I3S1dOYzU4amxmbmp0V1dtNkRveUlUNE9G?=
 =?utf-8?B?YSs2Ukg1SkVUMU45ZVBaOVdUb0hLM3EzZFpoN2pGNm5FU2t6WDFwaTFKRHcy?=
 =?utf-8?B?aDRGMW5oNGxFTnM1bXVwTzFwbDcvNFZYTjk1ak9jN1NMZkIyNi9aU3pZdVFl?=
 =?utf-8?B?ZzhRS3B3RWhTUW0zd3cvbGRlTHJoR0xmZ2VpQW5sVm9VdXVybW8rQ0tucGEz?=
 =?utf-8?B?azJKSVFYblV2dmwvdGNlV213VEtaYzhWUmxqU1BoakN5ajBOa3ZyV3ZwWEdI?=
 =?utf-8?B?UWZwMFVSMjY3NGRkNmVQUHZUTythRkZHVzdwNk90aitXdy9FdXF4QlFlMk13?=
 =?utf-8?B?MkZ3bE9MQ1ZNbm91R3BpOE8wVlhSRlNBYWFPbVkrb2QvN0l1RUQ3L1B1QVpO?=
 =?utf-8?B?U0dvaXlmRlEweGE0dktKK0JoTmJYU0EzTHpnZkdxUjREQ3hWMDlyZEttNDRQ?=
 =?utf-8?B?M1NCWEZrYVFqMXZyeG1oR1lYUUptUTBvVnRkVjRFUUhiRjhGc3B0aWs0NGhr?=
 =?utf-8?B?aVR3WWdjQWpPUjkrOS9pajJhZFJGRlZqM2NuTEFwTGNRT2hpck5ZVERzVzZu?=
 =?utf-8?B?dE4rbmlXZ3I3SmpVVlFSZ1d0QlU5SUsrUDFXUXFqRnkySElsYWd6RDQ3dHZo?=
 =?utf-8?B?WHYvQlNleFlROHltWjg0bDhLWE1rWVJZUlBhRnZtWTdsSHVhK21RNXBWRGVy?=
 =?utf-8?B?UDNER1ptbUtjc0tUMDFUYXcxSlBzUm9pOTY4a0NycW9nVU84RXVvVUcwZjFa?=
 =?utf-8?B?UUNlWk0xVFhMRWJTVVRzSVQrT05vWGJNckFZaDYrc2p0eWhlTVdSMmRrK0pz?=
 =?utf-8?B?TjJqVTNVeExYOXpWYXgzMGppK2VHZi94amJGQkI3YXpRN1BDbkRybU9JMzVj?=
 =?utf-8?B?SGg0dkVMdnhlRjErVHdUVjRaSFlhN3I2c2k5dWhqeUx1dGNqTFd3UXEyNnR4?=
 =?utf-8?B?WTRMWXJiWVh2aFVuRzVMOFJTaHZhV21ocGtDenNENWVYZXRSM2dOMW9PbjN6?=
 =?utf-8?B?am12YmY3ZE9HVDlkaWpPYURkVEhpRGxSUFFUN3JJQitQSlBvNjRqSllzVENZ?=
 =?utf-8?B?Z2pqUlh5Qk1tL3IrZVJoL2M0eXEyVzNrMVE1dnRtZGxJcXFmblg5NHRYWFh0?=
 =?utf-8?B?TnR1U3pvajh0TWJHUkpVMHAzQ1dOMlRSNDJqWlZtUERRdUZ0WnZ2VG9ZSVpY?=
 =?utf-8?B?T3psaks0MnprMjFCcFhXTjl2WVFMaWR4b3pIbS9EOFd5Rm1peHNGZmp0ZFY2?=
 =?utf-8?B?Y2c9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a639f77-79ba-48a9-85fc-08dd347b63c5
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2025 09:11:11.7493
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MqOT181d5iQdOB3SIBgFqPaJLMB5zYmrQoWAUGewWc6/sYDASbHE4AosotUFpI3xkwNFLTKdEux2eZESKeKEMogl9FqajyCgZJtkf+D/cWA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7060
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 14 Jan 2025 09:11:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6098

Hi Antonin,

On 1/3/25 5:34 PM, Antonin Godard via lists.yoctoproject.org wrote:
> [ YOCTO #14747 ]
> 
> Adding a initramfs is a common task, and the way oe-core offers to do so
> is by using the initramfs-framework recipe and companion modules. There
> was already documentation on adding an initramfs but the documentation
> was lacking details on this framework. Add it before the multiconfig
> section because it is a bit more important IMO.
> 
> Reported-by: Alejandro <alejandro@enedino.org>
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
>   documentation/dev-manual/building.rst | 74 ++++++++++++++++++++++++++++++++++-
>   1 file changed, 73 insertions(+), 1 deletion(-)
> 
> diff --git a/documentation/dev-manual/building.rst b/documentation/dev-manual/building.rst
> index fe502690ddc45694a9b0ae2d5e98894fe5153d74..fe720fcacc562c70bb886062153b587f5df11651 100644
> --- a/documentation/dev-manual/building.rst
> +++ b/documentation/dev-manual/building.rst
> @@ -280,7 +280,9 @@ Follow these steps to create an :term:`Initramfs` image:
>   #. *Create the Initramfs Image Recipe:* You can reference the
>      ``core-image-minimal-initramfs.bb`` recipe found in the
>      ``meta/recipes-core`` directory of the :term:`Source Directory`
> -   as an example from which to work.
> +   as an example from which to work. The ``core-image-minimal-initramfs`` recipe
> +   is based on the :ref:`initramfs-framework <dev-manual/building:Customizing an
> +   Initramfs using \`\`initramfs-framework\`\`>` recipe described below.
>   
>   #. *Decide if You Need to Bundle the Initramfs Image Into the Kernel
>      Image:* If you want the :term:`Initramfs` image that is built to be bundled
> @@ -308,6 +310,76 @@ Follow these steps to create an :term:`Initramfs` image:
>      and bundled with the kernel image if you used the
>      :term:`INITRAMFS_IMAGE_BUNDLE` variable described earlier.
>   
> +Customizing an Initramfs using ``initramfs-framework``
> +------------------------------------------------------
> +
> +The ``core-image-minimal-initramfs.bb`` recipe found in
> +:oe_git:`meta/recipes-core/images
> +</openembedded-core/tree/meta/recipes-core/images>` uses the
> +:oe_git:`initramfs-framework_1.0.bb
> +</openembedded-core/tree/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb>`
> +recipe as its base component. The goal of the ``initramfs-framework`` recipe is
> +to provide the building blocks to build a customized :term:`Initramfs`.
> +
> +The ``initramfs-framework`` recipe relies on shell initialization scripts
> +defined in :oe_git:`meta/recipes-core/initrdscripts/initramfs-framework
> +</openembedded-core/tree/meta/recipes-core/initrdscripts/initramfs-framework>`. Since some of
> +these scripts do not apply for all use cases, the ``initramfs-framework`` recipe
> +defines different packages:
> +
> +-  ``initramfs-framework-base``: this package installs the basic components of
> +   an :term:`Initramfs`, such as the ``init`` script or the ``/dev/console``
> +   character special file. This package should always be installed if using any
> +   of the additional modules below.

Not sure the last sentence is necessary as it's listed in the RDEPENDS 
of each package, so the user doesn't need to do anything. I can suggest 
to either remove it or change it to something like "As this package is a 
runtime dependency of all modules listed below, it is automatically 
pulled in when one of the modules is installed in the image."?

This package should be added as a runtime dependency of custom initramfs 
modules but that is specified at the end of the section, so I don't 
think we need to specify it here?

> +-  ``initramfs-module-exec``: support for execution of applications.
> +-  ``initramfs-module-mdev``: support for `mdev
> +   <https://wiki.gentoo.org/wiki/Mdev>`__.
> +-  ``initramfs-module-udev``: support for :wikipedia:`Udev <Udev>`.
> +-  ``initramfs-module-e2fs``: support for :wikipedia:`ext4/ext3/ext2
> +   <Extended_file_system>` filesystems.
> +-  ``initramfs-module-nfsrootfs``: support for locating and mounting the root
> +   partition via :wikipedia:`NFS <Network_File_System>`.
> +-  ``initramfs-module-rootfs``: support for locating and mounting the root
> +   partition.
> +-  ``initramfs-module-debug``: dynamic debug support.
> +-  ``initramfs-module-lvm``: :wikipedia:`LVM <Logical_volume_management>` rootfs support.
> +-  ``initramfs-module-overlayroot``: support for mounting a read-write overlay
> +   on top of a read-only root filesystem.
> +
> +In addition to the packages defined by the ``initramfs-framework`` recipe
> +itself, the following packages are defined by the recipes present in
> +:oe_git:`meta/recipes-core/initrdscripts </openembedded-core/tree/meta/recipes-core/initrdscripts>`:
> +
> +-  ``initramfs-module-install``: module to create and install a partition layout
> +   on a selected block device.
> +-  ``initramfs-module-install-efi``: module to create and install an EFI
> +   partition layout on a selected block device.
> +-  ``initramfs-module-setup-live``: module to start a shell in the
> +   :term:`Initramfs` if ``root=/dev/ram0`` in passed in the `Kernel command-line
> +   <https://www.kernel.org/doc/html/latest/admin-guide/kernel-parameters.html>`__
> +   or the ``root=`` parameter was not passed.
> +
> +To customize the :term:`Initramfs`, you can add or remove packages listed
> +earlier from the :term:`PACKAGE_INSTALL` variable with a :ref:`bbappend
> +<dev-manual/layers:Appending Other Layers Metadata With Your Layer>` on the
> +``core-image-minimal-initramfs`` recipe, or create a custom recipe for the
> +:term:`Initramfs` taking ``core-image-minimal-initramfs`` as example.
> +
> +Custom scripts can be added to the :term:`Initramfs` by writing your own
> +recipes. The recipes are conventionally named ``initramfs-module-<module name>``
> +where ``<module name>`` is the name of the module. The recipe should set its
> +variable :term:`RDEPENDS` to ``initramfs-framework-base`` and the packages on

s/the packages/the other packages/ ?

> +which the module depends on at runtime.
> +

s/on// as it's duplicated by "on which"

So either,

the packages which the module depends on at runtime
or
the packages on which the module depends at runtime

> +The recipe must install shell initialization scripts in :term:`${D} <D>`\
> +``/init.d`` and must follow the ``<number>-<script name>`` naming where:

s/naming/naming scheme/ ? or "convention"?

> +
> +-  ``<number>`` is a two-digit number that affects the execution order of the

We should make it very clear that it needs to be a two-digit number, 
yes, even between 0 and 9 as it's sorted alphabetically, so 10-something 
would be called before 8-else (because 1 < 8), hence why it needs to be 
08-else instead.

> +   script compared to others. For example, the script ``80-setup-live`` would be
> +   executed after ``01-udev`` because 80 is greater than 01.
> +
> +-  ``<script name>`` is the script name which can you can choose freely.

-can

Yes, BUT, if there are more than one script using the same number, the 
order in which the scripts are run is the alphabetical order I believe.

Looks good to me otherwise,
Cheers,
Quentin

