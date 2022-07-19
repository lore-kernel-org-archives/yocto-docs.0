Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30DA6C43334
	for <webhook@archiver.kernel.org>; Tue, 19 Jul 2022 13:02:49 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.85])
 by mx.groups.io with SMTP id smtpd.web08.40335.1658235762224249942
 for <docs@lists.yoctoproject.org>;
 Tue, 19 Jul 2022 06:02:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherrycloud.onmicrosoft.com
 header.s=selector2-cherrycloud-onmicrosoft-com header.b=RuhhnN7I;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.22.85,
 mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J8JHCWQRpAn3ajtIqJUe3RyVxxGJ0VH29X0MbjSGYBXL3HZ38VvM0UwFHpDT29VwKhk0TdQlbXuDSYvliP9BPo5MpsRDI/SwgsPW6AJBWbC/M/fvc+07O6CWpwcpeFttM28gfZc7g7FJ1XyKed2MkQbTO3sA/UvpxqP3Ra/sqU9J+T/4+U5f+yEFuPkR1ddF3GtnyXUG0CpUGIHNxJmCNs9ctDRsIkI1Dg1WwIw13hruk+dvelbOqGKYB3knJFi3r4nFHwo94NgZEeCXd9/BqfNuBe9d8prVuTPDTf5VAHoqrRm6uMCq7C5IuMzhIPfkc9Z5DLOmRyfpdp09r+n11A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4DbTm4l1we8/oBqvzSvORnLXDUg2FnnPtXYVWGagUxI=;
 b=VPsG695pCTUnPKbL9f2wk7yamFWuy2O7GLQ+M5P2R/+09BimmfSBQspBW2k0ywcMK4eNQ/IrN2jypfVdxM+9EvrwSySAfLhksuwHmFAETpN9J2yuV5BazuIt0Y7MghapHgGalAQpPI1GJd5jrAxsyZjroLCiuyXpTJOCZMuPThysq3wYHJTKeexZpQhFdbUB89B976x9vv908i0aB5a1nM0Wi8IQ/t6e6aGDeMMgPqHhGfiIAazg3M268B6D6vI0lcC6RZ0qONrsQ3lNX8TNgK+rI93JOj2Bz4a1aIio3FR1KzLWklh11ALYOZAVTkMz3hFNObVImijk4rVsMp1Yew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4DbTm4l1we8/oBqvzSvORnLXDUg2FnnPtXYVWGagUxI=;
 b=RuhhnN7IX7ZtmS2ZK4Iez0xmoiSYqSxp3aWMr6cNfWAZEEQTLJ/l4zFbPBSovExK88VXszrZbTx4w5ObQ1MGkvyvY5Lb1L1LIB9eC/inbMUDvHTDNXPgieoDZJe4hq71enSHYwNtv1yGGO0RQanBQKru9dRvNYvYvJV98EyM8bc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com (2603:10a6:102:2aa::7)
 by DB6PR0402MB2758.eurprd04.prod.outlook.com (2603:10a6:4:96::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.23; Tue, 19 Jul
 2022 13:02:38 +0000
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::5c3:766e:66e9:8c4]) by PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::5c3:766e:66e9:8c4%8]) with mapi id 15.20.5438.023; Tue, 19 Jul 2022
 13:02:38 +0000
Message-ID: <59a58198-d0a9-0d04-8aa1-758b772872e5@theobroma-systems.com>
Date: Tue, 19 Jul 2022 15:02:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [docs] [PATCH] docs: ref-manual: variables: remove sphinx
 directive from literal block
Content-Language: en-US
To: docs@lists.yoctoproject.org
Cc: Quentin Schulz <foss+yocto@0leil.net>
References: <20220707133317.1202686-1-foss+yocto@0leil.net>
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <20220707133317.1202686-1-foss+yocto@0leil.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0086.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::22) To PA4PR04MB9367.eurprd04.prod.outlook.com
 (2603:10a6:102:2aa::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2d0be552-9879-47d3-6100-08da6986f51e
X-MS-TrafficTypeDiagnostic: DB6PR0402MB2758:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Uc407ck30njWm+HLs6zzOOMh1sGI5jyunC25DS8BQWuGGsqUYLMgHAYH6hKkTZju5ASFcIv4cF4keEbABBvGxRY2a9MqjmYSilStUZc8Q//Rduya9WIWNF68dOdNpbLuIg25JLMLlz+7LI9iI0JzWSgfgnFiG+vuXi9pI7hDcLyexjlAisx7TL/gTAUxiGXxArUhMnE/Um7yN6ypMSnsxlgroYI1/3765qtBXqWlfuhAddBE/Ns4Mz5JymUi7qu00Nu1GBNyCSCsZ1vr031Gy4ljcnGz/HOy6x2DGu6qO2a0FuNjNuiLSrzdFPIV0YeUFzn/wIHMIBGnwSOKSxCSLzTMfKYaa283XlwHsGPN/Re6abuH76ssM3bCrkuf3Mv9Ucri0iqGNKlfXFjeO0lkjSMGYrM7fucP/AKyozKSa8Fk/sU8qYb75hf6gTJS/0q3GMos7G2T/N86uJ+oq7VUqBw6rvY5BhP6iUqtPQ2TGB+t77lfeTHz6scFdm5hvnyly5vZw6xQTXEa1WHRx/nMlqetJunhTPOEg4QRY8j+6fxux15TONefFYsAhid9kssO+5HbSgwySw5zsp7d3swaURrdPoTDhNhiyeNRAaSen728JppFFPHX7toqbVkkJP+tIefiatHiwoywRB39JEKgmQhvMLPJLyBXJPMoJqvkUwQfrF/CIUVLkWaI6DPbZ0s9J6yqTs148WZb4Eyy+wpNkSQz+ZJYG/RlftEmnRSS6OFLh5dI5OKl7TG49qaBurNzFFRiwKjRig+qLs74ed8/kN66Q2WLZ2oSSO/BE62pYE1cHxJWQ0z+FD/pib2+hkHi2I9+vSPxSe4URikWA0fLXmoHJJP4RFFYNKRXRyuo4Gw=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9367.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(39840400004)(136003)(346002)(396003)(376002)(186003)(966005)(2616005)(478600001)(53546011)(6512007)(6486002)(41300700001)(26005)(66476007)(38100700002)(6506007)(4326008)(83380400001)(66946007)(31686004)(44832011)(2906002)(8936002)(5660300002)(8676002)(86362001)(6916009)(36756003)(31696002)(316002)(66556008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?NnFGUTVwT3o2MmNEa2YvZGZOSFdud0NrSXljcmZoL1JicGN6MzR4ak9waVcv?=
 =?utf-8?B?bXFuSHlNM1lXTE5iMVZPVlgvRTF3NGRIenNrckx6WHUrOWE0eGVjWXlyanRL?=
 =?utf-8?B?NzZvRCs5bDRoamRKdTVwZXVoSURDSHR5M21qc2J0N0grUjBTZi9Ua0JtUTZy?=
 =?utf-8?B?bUM5TVEyVDJpdnlqMmovcmtIdWY4RmRrQWV4Rjd4S3ZucEJPNEVpYU0vekxF?=
 =?utf-8?B?blF6cWQ5cENkaTE0cjI3RE95SDhIQXBuMlI2Yks5K0wxU21sYUZ0bVBSVGxp?=
 =?utf-8?B?UWZQR0FVZEVUUENMbys2YnJIb0xXK3E1YlZscEtVVHk0Q3duZGJkT1FlSkJu?=
 =?utf-8?B?dVIvMmlXakxkYTdFa054elp0aUtMYU4xa0VHWW1ySi81eVh5dzk2eG1FZ0Jv?=
 =?utf-8?B?aDh4aEVPWmRxcDNxVER1L093NmVDRkpmZ1FQQkI5eDYyditDQkhxVGVLQ3VP?=
 =?utf-8?B?NlMzUWphU1ZUaXJQeUVvOHdYWHZHYzI0bmxCdzIrL0xJb2wvcTZBemc4SFJD?=
 =?utf-8?B?RkoxQU5HZ0U5N3pVdVpBcHh6elFuNml5Y05iNHczSHY3SVJiMitLOU1YR1Jm?=
 =?utf-8?B?R2hTUzRWK3duVGtuS1FTaTZZcUYyMjVEWWc4cXlmQXZEV1JacEFwY3pWTTFT?=
 =?utf-8?B?Z3F0enJwenZBU2VBWGpnUndwcG1ldVl3MnVFQ3J1MklkVno3MEgzMzVRcWt4?=
 =?utf-8?B?QkRyVjQwZktmNGRocG1CdjFFUTJBaEkvSDdrdE5JaDlKcjFPbWlZV3dibE9i?=
 =?utf-8?B?L1Vra1RYY1NjdmQ3ZXNTVmRUL2dxdk12U1VXaVZoelVKYUV3L1RjdzcyTWpi?=
 =?utf-8?B?Q2VPSWx0WElwbGFwZDZNa2NvdEpXYUR0TTErWlJla2xoNm5FeVA4SjNuWE4v?=
 =?utf-8?B?NFUxWW9lMzlLa3VsNlBEWTEvaGZOeXh5YlhqK0xGcU9ZcjBLT0VJdERJQWd0?=
 =?utf-8?B?d0pVVVpyYi9zN1ZZdXViOXNZL2I2dUxuNGw2cnY5MjI5VzRrelNHMCtLY2FC?=
 =?utf-8?B?RTJrQmNMbVMrK2JGU3p2cE9OQnVKMGNBblFGRXdUSUFORWMremk5VDEvVS9H?=
 =?utf-8?B?dFBscFZZV3FxazJGL243dUZTa3NOcDA0bmtXdUlzNFh4Y3d3a0pMM2I1ZEpT?=
 =?utf-8?B?REJLNmZRN1pTRTA3V25tcjlYNzFvcGxOcys4SDA4bURIbVJXL1JtamtObEE5?=
 =?utf-8?B?cENGUlNFVE1sNTV4UDRsSldHUUFGQythcjZISmRaM295dWs0RVRuUWNwYXJI?=
 =?utf-8?B?cUJjc0o3a2w3UWJlUncyczlUaXF2eUY5MmU0SnlWZTFEdnZiZjgxSHBnOGlF?=
 =?utf-8?B?MkdmZWVTOFVZYVN1ZHlVT0pkbHRsTlNrT05nak1va1hkQk14cGJzbUpBVmhs?=
 =?utf-8?B?aUppaWd6VXJIWHJ6TWRmc0t5ZVk1eWVudC9OdDNLVGFlNlFYQWxZUnFVNDV3?=
 =?utf-8?B?dm5Wd0JtaDl0Kzh2M1Q5OXNLUC9tcFoySzBmWmpUQ0QrdTJKUHJLM0VPejZu?=
 =?utf-8?B?eUMzVzJLdDRCajhSa2pEWTlmWHROaTRMNEg1VWFxcGpqdHd2eFJmT2tKNDVN?=
 =?utf-8?B?bDZiaTVtenRnK2FWYUM2enJ5c3VuMnkzK2wyYklzaExZVWVmTmFmTnl1YVcy?=
 =?utf-8?B?cXNvYXlESW16QnpUNVpSbC9TZDJkcDdNczl2V25IVGEyNG1IU0xtekJRcCsw?=
 =?utf-8?B?b0JVNzd0WWNLWkNWc3crR2lNV3o2bS9DYW9JZzNha2VNK0lKOVF0TGtZWE1m?=
 =?utf-8?B?SmFGbHhLTjV3cDNEU29CczVzWWp0V0c5RmRNbHdzRHdaNE5DYXg5MHNaYlFN?=
 =?utf-8?B?ZncxWjVkMmhhMmUzd2JRd1ZuelpTVTZuNExrQk9qOVVYV2xscFJncmwrb05u?=
 =?utf-8?B?emZQaTRLQ2tBZ1kvcnhlS0ljeUJEbG1wa0I3OC92ZTNzTW51RVRteTBLaHd2?=
 =?utf-8?B?ZzhjU0V5c1lmbGFLSDdvdjRsU1JPSUFoaUxzU09jZXEwTU9mU25IYTJyTEll?=
 =?utf-8?B?bXhHMmpCbTF6R05SK0o0OEdkZHRLQ2todlAxOFh0Q1pFazhDYW9jOUFaQy9u?=
 =?utf-8?B?dlhLYU1WTWFVTWhnVzVYdGpucWsxTkFVSUVIcEljbVhta3lIRVhCb3o3cURx?=
 =?utf-8?B?OWlHUllaOFJCazhYeW9YNVJOZlkxeENNdHdvU2ZQSkg3a1RYWXlEbFRvTVhS?=
 =?utf-8?Q?bx59Ux88+GVLGCwvK26SD9Q=3D?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 2d0be552-9879-47d3-6100-08da6986f51e
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9367.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2022 13:02:38.6553
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 6xE9yZHDvjnbnB6E4bkGTus0IItmfGeEkC0bLqF4N0rAP+WYo8lEQf0/MtIYvTbKG0PXfa/5JyV+ik12x720OOtURWIqiSOe6zx0CtzItJGz+o4M/rpR4n2ZIPWhrpUH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0402MB2758
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 19 Jul 2022 13:02:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3069

Michael, I see you're being active again so pinging on this one so it 
does not get missed :)

Cheers,
Quentin

On 7/7/22 15:33, Quentin Schulz wrote:
> From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
> 
> Literal blocks make sphinx take their text verbatim. This means that
> directives cannot be used in literal blocks. This means :term:`S` was
> printed as-is, without actually creating a link to the S variable
> definition as would be expected outside of literal blocks.
> 
> Cc: Quentin Schulz <foss+yocto@0leil.net>
> Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
> ---
>   documentation/ref-manual/variables.rst | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
> index c4b2119f2..dbb7a4628 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -7660,7 +7660,7 @@ system and gives an overview of their function and contents.
>         :ref:`systemd-boot <ref-classes-systemd-boot>` class sets the
>         :term:`SYSTEMD_BOOT_CFG` as follows::
>   
> -         SYSTEMD_BOOT_CFG ?= "${:term:`S`}/loader.conf"
> +         SYSTEMD_BOOT_CFG ?= "${S}/loader.conf"
>   
>         For information on Systemd-boot, see the `Systemd-boot
>         documentation <https://urldefense.proofpoint.com/v2/url?u=https-3A__www.freedesktop.org_wiki_Software_systemd_systemd-2Dboot_&d=DwIDAg&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=-WnObifONJTQG6gPXN4yQJt-q2jucv7LUK4MWCH47bGkKnfvKA-E_60a64_S-BBn&s=G2yqi_HANVsx7VddtaRLxM9pWdReEqcPY4i-a49RQSM&e= >`__.
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#3053): https://urldefense.proofpoint.com/v2/url?u=https-3A__lists.yoctoproject.org_g_docs_message_3053&d=DwIFaQ&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=-WnObifONJTQG6gPXN4yQJt-q2jucv7LUK4MWCH47bGkKnfvKA-E_60a64_S-BBn&s=1o0IcdjncqOzjO1W7q4onKC4LUV-SVTFHM3q7mW8OoU&e=
> Mute This Topic: https://urldefense.proofpoint.com/v2/url?u=https-3A__lists.yoctoproject.org_mt_92228284_6293953&d=DwIFaQ&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=-WnObifONJTQG6gPXN4yQJt-q2jucv7LUK4MWCH47bGkKnfvKA-E_60a64_S-BBn&s=1xRjxcjduk4X5G6Icz9Eu6tucn1NDdl-Mmr2T1ScjMw&e=
> Group Owner: docs+owner@lists.yoctoproject.org
> Unsubscribe: https://urldefense.proofpoint.com/v2/url?u=https-3A__lists.yoctoproject.org_g_docs_unsub&d=DwIFaQ&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=-WnObifONJTQG6gPXN4yQJt-q2jucv7LUK4MWCH47bGkKnfvKA-E_60a64_S-BBn&s=yx9TaufiGxGlpJcPYeN4zxhvIrrYMFzbAlOtILo0I1Q&e=  [quentin.schulz@theobroma-systems.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

