Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E9DFE7717F
	for <webhook@archiver.kernel.org>; Tue, 17 Dec 2024 10:48:17 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.46])
 by mx.groups.io with SMTP id smtpd.web10.78701.1734432487697193373
 for <docs@lists.yoctoproject.org>;
 Tue, 17 Dec 2024 02:48:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=lELw4flF;
 spf=pass (domain: cherry.de, ip: 40.107.21.46, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WZU9lUlCvx2SG+XlhNA2zuars7kPeFNCUq6wPNiRT8GzZE0LYv/Gn4h40feGzxPtpuLCy4in6Ajbs7sNlrAv0i79mM36bSmTY8GV94ZfgCsxNgBCYqXoHNOLOmV5rpd2pOfM/6iHjPvkaeWq6emXOu4ZqS4zowj2uC7nmBjGA4Y+WPLK51JQcQWH5U7Fl/ZJBdIErz/Kdvco8HUkqby0FfyJ/hk/E+uIrnADS70sWBv51KYOgRGgYj/5P8afSJh8T+e5oKulGzPENpylu7nEDiEhHVTdpf/Q95u4peT5b6ziXp3VL0BQ/DcGiKWOW8oukRQYy6AfXdhmwhXHWtMpvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/uXlL2bj84D/DQpem2Ex/8ZCiCaReho8Qe2nuzbuUPk=;
 b=SBJIZnKQ+fZ6MYO34JN+sVb+Jeyd3QohHHqRcmOlNM3PIVG1jpt0rtZk6gOmTowLofMPWcsF5yrfYjyJixncq6zmHue9QlIm2rA7LLrhJd8KuJTK2hpm+qXd36nj/S+2WJMPOpPH5pyklqlrZwy9GYVg2P4djqQ0RC96yEbjlDtvs6FNaRkOY4O09PcY2YL/4dxMXYDz/ZEaYVBIzGj8JTw3euuNTxyVyu8Gd5sTqcYf0iNdrRa3cF3nyslUIcqqhhKArRnToHCRWIvI2y05LoznJ40wmP+RQ/bh+H2V68WmZUhc+m0sJniwnVwZf8NPsjavqs7fTxybON1xqWo80Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/uXlL2bj84D/DQpem2Ex/8ZCiCaReho8Qe2nuzbuUPk=;
 b=lELw4flFoA4nqg3yiKLKB/xaGw0XoGGEuS5UOy2d2EzRfUOjECYM+9Iz0gnC2VferrceeonfdvHjVM7t0U4XBbk91w4RXqvS3K5N48q/c2Hyj+FQlBOU9efSNz9iWrfYqV1I2zX5YQ7CoRoYnDpQVUyjBGAjw3ToAx3uxHy3afM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by PA4PR04MB9440.eurprd04.prod.outlook.com (2603:10a6:102:2ac::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.16; Tue, 17 Dec
 2024 10:48:03 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%3]) with mapi id 15.20.8272.005; Tue, 17 Dec 2024
 10:48:03 +0000
Message-ID: <d7746edb-c7b9-47ee-a793-43c15fbc00c4@cherry.de>
Date: Tue, 17 Dec 2024 11:48:03 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [yocto-docs PATCH 07/14] ref-manual/classes: document the
 cython class
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20241217-release-note-5-2-updates-v1-0-b189493b1b09@bootlin.com>
 <20241217-release-note-5-2-updates-v1-7-b189493b1b09@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20241217-release-note-5-2-updates-v1-7-b189493b1b09@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0104.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a1::20) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|PA4PR04MB9440:EE_
X-MS-Office365-Filtering-Correlation-Id: 938b3fe0-cf42-4039-47f6-08dd1e884872
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?OGdFK05COC9ST25HNHhmdkRQajFSZ2p0VFF0SlhvdDhhMnE2b2pOOXBNLzE4?=
 =?utf-8?B?L1Z5alZFU004czFiQnlvVXZBOXMzbVpMcUFLWWc5TVYxbGdzS0prM3djWGxL?=
 =?utf-8?B?R3pwV0dDRTB3Y2dFbStaUUl2MWJjdm81TzRLanlYNG1PYWtXQ1VSWU9ORjZq?=
 =?utf-8?B?OFVBRzFlREtKeFFWZHcxZ1hEaU5qUE9ROGVNYXpuZitBc1BSTGcwcjYzMWth?=
 =?utf-8?B?NG1TU2NCNXFKZmJjdnNiVzN2TXJDaGNRQTE4SGFCUisyN0VKRjBOR0ZQZlk4?=
 =?utf-8?B?YWlVTEFia1A1Z3VDb05HRHdFMkJ2Nldabm5jdXI5UEc5WldjUWNqb3ZMaFBM?=
 =?utf-8?B?VXZXWG5LVXNjRkFvcExCblUwdXZpaWFNNU5GSFc5aEZHN243QkRlc2cvTTRY?=
 =?utf-8?B?Qjd2N1VZeDNsWSt3cmZjeVcxVjk1MldXWUlrc2FYYURPV0VLdjgvQnhxNGdy?=
 =?utf-8?B?QnVJUDkrVDFqUGhyVFZJVEdScHBEWGd1cHAwZGNCOHBDYnVab0IyTDZ3M2Jm?=
 =?utf-8?B?TXVzQ2xMYWVIblpEMXVZZEtHeHp5M0h5aGR1bEIzQ29haUR2YkVPQTFPNzVi?=
 =?utf-8?B?b1VzNzdFRElOZjJGT3JPbGp2UWxYWWhMK05aa2orZHJ5dTVRaHhhTndwM011?=
 =?utf-8?B?My9sd0dESVVIVmFpaHhnWU1CMEdHWC9ZT2p4ZG4ydFRmeTh2OVpZb3p6dGRr?=
 =?utf-8?B?TTgvVXNkcS9FNGdLQXVUV1JsaW1rVzFGZTFzVy9kVE9TeWFscHdmTDBpaFN3?=
 =?utf-8?B?bms5K09MNkNOK2g2RzJLRUViYkk1bEFXa1E0aHRjcTQzdEZ3YlhsbStKNnZx?=
 =?utf-8?B?L1QwZlNPOWViRzIwSjRweUpzQ1NncjJSRiszdElSaXY5ZEpwV0tHNGlYRi9x?=
 =?utf-8?B?VVg1Sy9VZURIdmRuRGhBeFQ2N0FPRUNaKzdrd0xOaG1XL1VKcVZWYzI2STU1?=
 =?utf-8?B?eHpCVHp3ZzZITDRCckdFTzNTYmFISmZ2bm9hOXZNaW41bVlvMXB2SGc2K3BK?=
 =?utf-8?B?N2lVaDQxQ1VhYXJMdjFCQk1XYkkyODZwak0xUkJwVVczYXRKT1llQTB2cVJE?=
 =?utf-8?B?Z2dqVUllNDlyaEtoTkMxRUtocHJQQVVBTVNhdmlya2tKbDd0QkdPUmZrSmRS?=
 =?utf-8?B?TzZKQ1JoZGR3Vk1SYjFmcjFYb0ZxK0FKaXBxamF6djhoYnZQMHBSZ2xMWnVH?=
 =?utf-8?B?VzFHcDJGbmVXSWhZK3poeDRRcm9XRUZBL3JDSWFWL0RsRVREeUVzMFU5NWVv?=
 =?utf-8?B?R3kyVGxTajlGSW9xcjBoS2haKzRFVThzUkk3R0FZSG02QmNIdEpJeVZCNTRW?=
 =?utf-8?B?ZXdKRnBFQWxCeGpjbXRTa2MyeEJpbmg5UmpGTkpnUDJQTlRpRlhKTnpDdkt2?=
 =?utf-8?B?dkdUM1BteE1kT1ozQ2haUlBuUEV5RE15a3QwQ2lZK3RsaVZaak5DSEwvSVlN?=
 =?utf-8?B?RXVkQnJlV1BZMW90VzNLZHhDaWtROXFxVkQzbGFLbEVLVnZMb3NMN0RkNkps?=
 =?utf-8?B?RzNBYytXbmtoSHhVczBSUGhuZUtDSWxZSnBsQ2k2OWFNaFlZMnI2WUp0RTdP?=
 =?utf-8?B?MHpndXNCT01HanVaRUlxdVZlc1pUeDFlSFJvM3lhQ3AvZVhad0xpTUdvaTJ0?=
 =?utf-8?B?Mi8va1NhZzRIc2dwekhCVS8yYXZHKzRpdENwR2RQQTVaalV3U3NncUc2bjFE?=
 =?utf-8?B?VUhPYkhrT252NXBFU2lNM05jSy9ReGhVclBoREd2SjdUZEdVY0l2djlMaGIw?=
 =?utf-8?B?NFZ5cFYrVHdkM0dTMVJRZVdGTUtYRzhDYkpHMVVXQ2FDNnNDbkZOZjRRbXIy?=
 =?utf-8?B?QmtZeFFrRkJVS2pxUzRtRnp5SmlMRTY2RFlTRW1KSXZpWlRKeDR2YWh5Qlds?=
 =?utf-8?Q?Mv5WNY/TGWM3i?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?WWI1NGdxbFAxcHd5dHNpZU0vM0gzZy9pWDdRSjVtYlhnRGM0a1g1c0xQV1Fm?=
 =?utf-8?B?eDRYS1NXelBoRkdqVUFBYzlDTnJZYkcyUm9wSEE5MXYzYmdub2pEQUVUa0dP?=
 =?utf-8?B?UG5LQmh5ZnQ5eDkzSkxWV004Mlg3UnBodjZjbEx1RWN2UGtxL29oUnkyWkJl?=
 =?utf-8?B?VG1YRmY4YlJFSFJ6dWpPTXpuYlk3NEhaekFCa1FONXB5bXYyaG50cWFsL2cz?=
 =?utf-8?B?NTc5SXZTdGViRnByTW5nMyt0V0NHQmh4aUo0SVFqM3hVVnN6VUJiRW1neXhy?=
 =?utf-8?B?cEtCelo4cHBWSHpWS0FSR1pKUTVxTTc3UnRoNTZwZzBwOTNJbXJZWnNmUDhS?=
 =?utf-8?B?QVlEZjFkOXJRN1FDZXlreUg2VXlGbExldWdBaHNpWGsyT0RXNVovd3J0U0xw?=
 =?utf-8?B?RzE0cC8rdkpGdk9HcFlSMlUyc0lyMWgxdUNrMGlDQXN5Nm8zcGc5dXVwMlA2?=
 =?utf-8?B?MWdKNEJJZzIwU0ZhNWR5b00zZUVZZ1o5eUJ3bWpjZzMyM0cvMElUMy8waFp0?=
 =?utf-8?B?Q1hBZ05MRm9YaXJUcXErL0dnaVcyaXh2MjNwNjFJa2hFNjhubTlkWEIvTE1B?=
 =?utf-8?B?aS9WQzVmcTdQNkt6WHMvQzVmNC8waU1HeHAxWlY1U1dvaVZ6K1BwaTZXWlIy?=
 =?utf-8?B?ZDZ2WGdoWTNvRC9SRmpYRUV4bU5vcnU2K1JMb2h2Q0ZOdWdSR2RxTU9wY1Vi?=
 =?utf-8?B?UmlDdGVXbDBvc2xnSS9XN0JiY0MzalY5dE13V0phUTYrd2lPNHVEVVp0Vmth?=
 =?utf-8?B?WmdWMWY1a3l6eE5rRnJMOTNiSjE5dHpqQURRSTRFOVJmVUNYcHdMRy9HOHpU?=
 =?utf-8?B?eGtCMHd6N25PK0JKN0kxb09Nb2tLRnhTdk1uTGVYMHhLejN2cTJYNUNpRFJm?=
 =?utf-8?B?V0UzMFR1TVRQa01OVXpiSmFaUXVKVnJpT1ZpV1pzTklTZEVsejk2bmJXb2Vh?=
 =?utf-8?B?ZjNWaXkxZmRBUGlJM2x5UXFrWnZHUmRvQWR1cUk2TC9RZEhndFJDTW9pUUVB?=
 =?utf-8?B?QWZnNEpwNlBaMXBXcGh1MndEeWtuZWJQUHpQTTFiVVAwZHE5b0E3NDNLN0gw?=
 =?utf-8?B?M2NqWkU4Qyt2YnU3VWVtTnlTOWc0c1p0OGJaWk1PTFlmRzRXdU1oZFlTMXZk?=
 =?utf-8?B?NUNCUnpTVjlOYlVJTGdlaWRPTnhJeEhPd09taVptc1V3YzFzTjNSVUdORHdj?=
 =?utf-8?B?YlhrNXBiRHpFejYxZy9rWlN0azZaZXdvZk43WG44L3NCSlQ3TWkvWnU0Tk93?=
 =?utf-8?B?Nm9Yek8vYXBOQWNHa2hZV2U4RU5NMVgyc3duNVNSVTJpc1Y2YnJFdTh3Q25E?=
 =?utf-8?B?RlJ4dlI2OExRMGRZTjRFWXpqSy9KSlgxY2lzdHl2a09JbklZMWFFSVcwQnRj?=
 =?utf-8?B?R1h3Unc3Y2daY2NWdlRlR1g1VzNpOWZ4V1ZTZWNFNjBDZ0JTek1VdHpuYWxN?=
 =?utf-8?B?TUZXMVZ1K3plRlRKOGFoZ1hUOC9yKzZrcHh5MGdNdUNKeGRwQzEyYVB1djVT?=
 =?utf-8?B?OTQ3YlpIaW1vVHpuUnhBOXBxN3EyeTNJRG8rc0FMdTQxUi81eUVEYnJtM0sw?=
 =?utf-8?B?THdqY3gvd3MrTnpWQXhkWElpVStqaDhYelNOdkl2WVN2LzlITUJzOG5jOUZX?=
 =?utf-8?B?Z0tBc0ZCbjRaK253NmJtU3RWMHZEdDZNUlgvcWl6dGt0eVFxamxCckc1a1d6?=
 =?utf-8?B?cUxSOEhncmk2S1NrUGJ0VWNpYzdSSEJlZkRKWDNjY3I0cnhrcWJYN2I2dFdK?=
 =?utf-8?B?TExFNDg2WWNIK25zRWVNTjBuVjlqdm8yakRHcFR5SkRyK3BianFoRjdDOHlK?=
 =?utf-8?B?V1B5SmJCSzdrZnFBbU5qV0xzV3dRdlN1cFNpczZiRUREZDc4NjNOdHhja1pr?=
 =?utf-8?B?MERUS0ppNWxLYXpIQ0NkYW42RklrK0FzVXNoSHZVL1l6bHFxd0tiTHI2NDVZ?=
 =?utf-8?B?bjNlWVFleUQxOWIyekREeFpseVhvMGM4NExEVFo2MUxJa3Q0bktyM0EvN2xJ?=
 =?utf-8?B?OVh5amZLNzFvWEg5elZtV3FxRGhJK2VWenM0TkFQRnY0WFRWRmxmNms4UFhx?=
 =?utf-8?B?RjdGUGNTWGZqRzBkc0tVRVVvSHpKRWkxY1FaUHViN0dKajJ4Q0NEMXNLKzFG?=
 =?utf-8?B?dU9iTHhhbWpRTHJJSkRmY24wdXI4TGt3dWZJRUZpR2RkeldONk80TnVmbS9m?=
 =?utf-8?B?ZGc9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 938b3fe0-cf42-4039-47f6-08dd1e884872
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2024 10:48:03.7507
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w0yOOSVqCkBf0uD6gR2Y3dnpgifHGeDeAf+jlycdW4mShOZOyRBA8CFGA0MDL4W3wg44RSgw70CrOK8BWBhGjM2hpTMWuekEkdypUQpIbK4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9440
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 17 Dec 2024 10:48:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5959

Hi Antonin,

On 12/17/24 10:27 AM, Antonin Godard via lists.yoctoproject.org wrote:
> Small class added in oecore by commit
> 64b6e8580842949be58f97f4dff91d1f097c4020 ("classes-recipe: add cython
> class").
> 
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
>   documentation/ref-manual/classes.rst | 11 +++++++++++
>   1 file changed, 11 insertions(+)
> 
> diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
> index 3d61d8d7a00b21fcff82a771f9718013fae36694..47f049c7435a989f30c033b7b12d86482686ac77 100644
> --- a/documentation/ref-manual/classes.rst
> +++ b/documentation/ref-manual/classes.rst
> @@ -614,6 +614,17 @@ You will find some more details in the
>   ":ref:`dev-manual/vulnerabilities:checking for vulnerabilities`"
>   section in the Development Tasks Manual.
>   
> +.. _ref-classes-cython:
> +
> +``cython``
> +==========
> +
> +The :ref:`ref-classes-cython` class can be used by Python recipes that require
> +:oe_git:`Cython </openembedded-core/tree/meta/recipes-devtools/python/python3-cython_3.0.11.bb>`

I'm not entirely sure this is a good idea. This will eventually change 
during a version upgrade and the recipe at that version disappear and 
this link be useless. Two options: no link or a link from a specific 
commit so it is always there.

I am not entirely sure pointing to the Cython recipe provides anything 
meaningful here so I would vote for removing the link (could be a link 
to the Cython project instead?).

> +as part of their build dependencies (:term:`DEPENDS`). It also improves
> +reproducibility for these recipes by stripping potential leftovers build paths
> +in compilation outputs.
> +

I'm not sure the reproducibility improvement need to be mentioned here. 
It seems to me like this could be interpreted as "if you want improved 
reproducibility you can include this class even if the recipe doesn't 
need Cython". If it needs Cython, I assume the leftover issues for 
reproducibility are coming from Cython so it's expected we fix those? 
Not sure it's very clear what I'm trying to convey here?

Cheers,
Quentin

