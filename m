Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFD94C433EF
	for <webhook@archiver.kernel.org>; Wed,  4 May 2022 14:38:58 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.80])
 by mx.groups.io with SMTP id smtpd.web12.233.1651675128922267065
 for <docs@lists.yoctoproject.org>;
 Wed, 04 May 2022 07:38:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherrycloud.onmicrosoft.com
 header.s=selector2-cherrycloud-onmicrosoft-com header.b=Kbir/wky;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.20.80,
 mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XwVIj7Qn5l4k2ETCsf8YFRjYR1j5xFX0pc8Dt39oGBUeeLNd48nGA+EDSINOibPs1M719P5OUS8sg4A7di2/wG2SbDinLVo65EXhMkVJ3eOE+7na504yhXI5rdsaOCRnljNn1jAF5ZQRx/6YdKGkV6wNZxXoASQkYRJZtnrWoNqj6elp/he48ugMn/TpgNlgycxVSdSAHz02dQWuqvAFBdmeM3rUa3QkzEVqrq706wG5SztHXSy3Anz8b680iSH0dmTucgttMZSfo5ZXppLFvW81TJN3xZxA5qYAYUAVSibiXVlf6xf1qwzpVfyq5tjWYdWb1/n11X66KfHlnEqWag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pPxOKPq5mVmD1N2kfxGKgosWjCKf09rdP9IWD5/cCHE=;
 b=Ugiox8FNDEVBMkF/OIcaKtffcdZgBgDJpEGs2VEYmlmF9XRTCzIj4e8eeHlioz7FxK/6LPCfwIDoGwl1UzaMl/xGNv7sskCUkte95UvhdobK6SWAT2qF2YybOzjdVF4Yr92xL/WHvvJw2r1litczDuBxBDIRkOmeIoCV0cN3x6gD0RQquqV70MWhAzVliJzYk4XsYUl0CpVo20hJovbdCoz4JEWr22Zq7VawjHpQaX7KnwCmXb4Etl83LUWpDfLXEYl55jOfigUrllp1qPvh/JxJcECae4yV42EzNfGBJN/Q1G1FtXZux6A1zdr2qV9vFz4dvLi3O/bqbPE8uqAcog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pPxOKPq5mVmD1N2kfxGKgosWjCKf09rdP9IWD5/cCHE=;
 b=Kbir/wkyoWIur2U1Fq+rbyq5EgggF21n9jlemb9ZAY7TDVx29E+nxJKuuV4jH9pDtKhd/rGTRj65fhcFfOKNIRjzmjjKxhXD/Nj6GI0FQTNL0n+9HAfKfO5RWJu6GkvFsKoEwPLNknVmt5H2RKymtDYFHCMg0EIEN+Rd3Z2Apzc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com (2603:10a6:102:2aa::7)
 by VE1PR04MB7327.eurprd04.prod.outlook.com (2603:10a6:800:1ac::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.25; Wed, 4 May
 2022 14:38:45 +0000
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::28d3:b4fa:2319:83fb]) by PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::28d3:b4fa:2319:83fb%5]) with mapi id 15.20.5206.025; Wed, 4 May 2022
 14:38:45 +0000
Message-ID: <d3155dc5-f409-078b-04c1-6f208845b099@theobroma-systems.com>
Date: Wed, 4 May 2022 16:38:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [docs] [PATCH] manuals: fix name capitalization issues
Content-Language: en-US
To: michael.opdenacker@bootlin.com, docs@lists.yoctoproject.org
References: <20220504142918.682815-1-michael.opdenacker@bootlin.com>
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <20220504142918.682815-1-michael.opdenacker@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR0101CA0027.eurprd01.prod.exchangelabs.com
 (2603:10a6:206:16::40) To PA4PR04MB9367.eurprd04.prod.outlook.com
 (2603:10a6:102:2aa::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4465f220-9335-460e-49c2-08da2ddbcab4
X-MS-TrafficTypeDiagnostic: VE1PR04MB7327:EE_
X-Microsoft-Antispam-PRVS: 
	<VE1PR04MB73272A46DAA533B662650D77C2C39@VE1PR04MB7327.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	WgIz54XPFyut9fUSn42FHgaRSoN1xyNXwPURRV20PuYVXFsAH9eIFQ763TbG7oV2R3zhOC08s1hT1SfLkuJCIPGLYbep3Wd9fqhCsgS6xNjQmepo0MOT68o7Ji6QvnH6jpI8z7itC1YnkVh80uJV8KmqYFbmP6WSO8+Ly3w6gouuGKHVxqg+RRi6hYu86evswGvMpcwAriRb8yzrgsPzMdI1CbA+GrbHPaqcJ5KCqmVFKM0W+PUKE1xAYVxiRpIxh5WP5nv8hC5gUVJuC0uOxoPJqp4CCtB6cPHkxVDtOLhujYe1sSek8AHSnrJ7UOMGKRhs0U8twNC36n865afHM9EJY6Rq2HNicuP1jbc9eAD8uMuYZQBODDCMoSaV4knoM7R+Pvs5RUdClSJ/MWZOJA7SPaAtDwbgr0ijoAU6syMg25aAYjaKxNEsOYNE0cklKPch8JmWqwwFj6QKT0HRnGxvFP4b4xJ0lft5B9E3Ff+ox2cvXKRwUrczQdywcbUpDPewwuSucSas3aX6YiK09YZf4P7corJnGcBnVbueKRCZHR9E1iJRSeAqf7ypaOhc22duO/RR1s4ssSzaRqPQbJDdMbnLATtrPwj2h5d4p5/y0dJzGmgQpauzcmqh/oyGCSbX3Qw9Hy9kicmGL7fJJZ1iD+PePJQCNcmVVyl0v1ek96QxIySkGRF+bN5jhlFGk8NcuYGN6c6m+sMuRBj7Sty2eL0GG28OVfCBWy3/ZphSmnYgpMtYp5DsVXZvWbZUSuDDHy1uWEoYnOvR72kab0lr8p8bVPrJqnUxWruR6RRn38a/YxDeD7ybRWrlbchu
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9367.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(31696002)(66574015)(38100700002)(86362001)(6512007)(2616005)(26005)(66556008)(66946007)(66476007)(8676002)(53546011)(186003)(316002)(44832011)(83380400001)(5660300002)(6506007)(508600001)(31686004)(2906002)(8936002)(6486002)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?aTR6dENWUWxsaFJ5aEo0b09NNWs0V0t5Q2UxVzVmNDFmcDBXQ081cU5MSkJH?=
 =?utf-8?B?TFloTEx0WHB0M1FvTjBXVVU1eDVRc0ZjTU94d2hiOEQ0OUlEb2ZUNWpRSmc3?=
 =?utf-8?B?TVErSHhUalBrSFZDTDdONitqSlV4SzFrR0VBS2Y1MzcrUE1CS09EZU1hMUI2?=
 =?utf-8?B?c0FGWitoQmx3UURzYUdUOWJDTEhCTDJUVWQyUmVWSDdtSVlSR2plL3dRSzBT?=
 =?utf-8?B?cHk4L0lCK1VBendZcjY0STBiMmwrN242T0RUak1qZzVyc3R6dkgxL3cvTVVu?=
 =?utf-8?B?ZFpCbDZmaEVKN1Ara013UHdDUGtGQ2dlb2l2TnZ2eHZkWGtHa0U5aFJPd2dX?=
 =?utf-8?B?TlJFZENBelhJdzFHbUdBSStmOVZPaFg2NC9XbHJRNjJRUmtJd01zYlY0UVU4?=
 =?utf-8?B?OUhaN0NRdVIzdUhLRDBEV2x2REJiM1BScXZpaWpIckNsT2lwcVh5ay9HWmxL?=
 =?utf-8?B?QjZGUE8yV0tKb0pxQzlQck41eGxETnpQTlRyLzIydENaN1pqMFNVM3NWMEoy?=
 =?utf-8?B?R1NpZnI5WHRIQUdSN2E5U1Y3TTY5cFY4N21iMW1YTlJrSVFJQ3NFV09XYW4x?=
 =?utf-8?B?S3pvL25MT28vNmxwWTkxc0N4aENCT1BCc0ZTSjRMRWI4SisybFpXVDErL2p6?=
 =?utf-8?B?V2gybDR6ZGpvcGllcC9pMFhlUlA1alhTQ0pOK0NZdzRrdzJ2UC9hTVo0bktL?=
 =?utf-8?B?aVFJaG5ic2Q3VlNyOGZ2SE1Ea1ZaZnpXcVY5RFZod2lEVGIrUXpSU1FGSjRL?=
 =?utf-8?B?Y3UyWU9kK1pMdXBKZXd4UjY5UTBKTC92OVA0bExiOWc1aWd3dUFaSzhyT21B?=
 =?utf-8?B?NjlwcEczNHZva1JsdEs1S3lvcGNSNXR3cDcyMkRQKzZGTGUwZFNFcC82Uk1o?=
 =?utf-8?B?Z2d0YkJWckZJRjdJcTVxUXlYMXZ0MlZBdUhmQjQyK0ZQclcwdnIwZzMxSVlz?=
 =?utf-8?B?dDZvM293ak1RaHJ0b055MGlKS2FZWnpsNUZSZjdySnVqVFZNOENjdS82K1lW?=
 =?utf-8?B?eElMUGpsTndvMnc4MldkelpPalF0L3Fzc3ZRcGZxRDNEOE1xT050bmtWenNx?=
 =?utf-8?B?R09VR1lwK1p4RzZtd1ZTSjJUbThVeUQwMXRhVkFaaUdGWDRlazkwWWFTL3gz?=
 =?utf-8?B?Q2J5aC9pbVNIM0lJZVkwbVZKTTZFaVlYRy8yeDE3eGptOTNueCtXVUx3cWNB?=
 =?utf-8?B?bysvTGJEbktqS3lUMCtHZXVBdHNSbTZnV001eHQzYXUweGR0S3BxMjVwYmdN?=
 =?utf-8?B?Q09BaENpaXRjazI1M0RlSHBvMUY3MGJFSDJYc1Y0SjBaSklPM0ZEcTl1YThI?=
 =?utf-8?B?Q00xREhDZC9UNmFWK2xVNWxCa2lzVXc0NndHc1BUVDBCWkJwRFJnZkowSlB0?=
 =?utf-8?B?bERmNXQxY1BuT094bGptY3UyaFpFZzgxc0d0a1I5QzVXRmJ1djlWanJqNEZz?=
 =?utf-8?B?OFhBc0ljTmFuT1pjdzIvMjBJTUE3YUJEMXFHM0RtajRPR2s3SndMRit5ZXVp?=
 =?utf-8?B?SjhPYW5xSFFJRW5mekZIeHFNTzFDKzlNbWw3aWQ5d0FBM244bjk5WEF5NEJu?=
 =?utf-8?B?Y09ka1V5VVFhZHpEdzhnMklLVHRpYWZRQ3JzNm9ONU1WQldxdk41QWt0cm5Z?=
 =?utf-8?B?SW13S3U4OWxBYjFKRVNza2RUU3NZUExsRkErUk4yTmM4U2N3T0EzbktYVk11?=
 =?utf-8?B?U2tobVZRQWpseDZ1bGVRZDFKWDZMVTg4VmVuU2hReHFtNzZ0OXJlbjE3Wjcx?=
 =?utf-8?B?aGFNcVZIcTJiQlFHTXJZUjFVbjUrZysvZjd4bW01QVZKOTBvSjRmS2ZHa1J2?=
 =?utf-8?B?Y2MvZmJ0Vjg3MGwrRlRlUW12bDgxTWJZTUhVUEIyT1dialhpd3hrQlZFcG5E?=
 =?utf-8?B?YmpiaGQ4T1IwWDVXZTBPNTRnRHQ0aEJrcXBuWEZ3VkwwQ1VNeDYyRkxIbGor?=
 =?utf-8?B?bmVGYXR3ZVRldDVHSnlIcndEMUUrNFhqeEZVTDA2ZEIzOUJCV2lHZ2l3bW1Y?=
 =?utf-8?B?UWJvcVJqU3NZdTNPL29hYmJ6V0Y0cnBZK1NrVERJcC9qWUxhOFNmN1dtQmVP?=
 =?utf-8?B?amZISS85c1ZsOGFkTG5KMGNBUkI0VTJpOHBjcmw0OWhFYWhiU0ZiTkp1TWFR?=
 =?utf-8?B?L21mWG5HdEI3SkFxR1Z2Z0Y1dXBBdFRWb09lMnBVU05EUDNiL2FIdEZuRFAv?=
 =?utf-8?B?bXY5eEpBdzFrbHRZd1BGSG5nTjAxekVLSloyZlBFaklEMzBXUkdEcEZ1NEVz?=
 =?utf-8?B?aTdUV1JhZFdxazJ0N1NMUVJ3ZEFvTFNUWEJoVlU3S1h0Q1pNdW5pWGN6L2tJ?=
 =?utf-8?B?OUxsZmE1NnpnRXR1R0xDZFlKa29PU2NRSHovYXZjbVIzK21hWUs4RXB0c1Zi?=
 =?utf-8?Q?+TaS+94Pcm57USMYzWeGXZGECk9EajeRtQs9S?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 4465f220-9335-460e-49c2-08da2ddbcab4
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9367.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2022 14:38:44.9496
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 8f6+ZGbQTGEHxkKdjSUMpuEq6Dg8f16rFa89b1CESdOb3I2uA3bEC1AvF8VU3qOG7HaRFOBAJx5yuRVHisNdFQiYa9QImv9G89ygxmSNQhztqiOpSp0ZKYvIC3Rvkxs1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7327
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 04 May 2022 14:38:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2909

Hi Michael,

On 5/4/22 16:29, Michael Opdenacker via lists.yoctoproject.org wrote:
> From: Michael Opdenacker <michael.opdenacker@bootlin.com>
> 
> - Using "BitBake" instead of "Bitbake" or "bitbake", aligning with the
>    title of the "BitBake User Manual".
> - Using "OpenEmbedded" instead of "Openembedded"
> - Using "Python" instead of "python"
> 
> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
> ---
>   documentation/brief-yoctoprojectqs/index.rst       |  4 ++--
>   documentation/conf.py                              |  6 +++---
>   documentation/dev-manual/common-tasks.rst          | 14 +++++++-------
>   documentation/dev-manual/start.rst                 |  2 +-
>   documentation/kernel-dev/common.rst                |  2 +-
>   documentation/kernel-dev/concepts-appx.rst         |  2 +-
>   documentation/migration-guides/migration-2.2.rst   |  2 +-
>   documentation/migration-guides/migration-2.7.rst   |  2 +-
>   documentation/migration-guides/migration-3.0.rst   |  2 +-
>   documentation/migration-guides/migration-3.2.rst   |  4 ++--
>   documentation/migration-guides/migration-3.3.rst   |  4 ++--
>   documentation/migration-guides/migration-3.4.rst   |  2 +-
>   .../migration-guides/release-notes-3.4.1.rst       |  2 +-
>   documentation/profile-manual/usage.rst             |  6 +++---
>   documentation/ref-manual/tasks.rst                 |  2 +-
>   documentation/ref-manual/variables.rst             |  2 +-
>   documentation/sphinx/yocto-vars.py                 |  2 +-
>   documentation/test-manual/intro.rst                |  8 ++++----
>   documentation/toaster-manual/start.rst             |  2 +-
>   documentation/what-i-wish-id-known.rst             |  2 +-
>   20 files changed, 36 insertions(+), 36 deletions(-)
> 
> diff --git a/documentation/brief-yoctoprojectqs/index.rst b/documentation/brief-yoctoprojectqs/index.rst
> index 12cab1db76..7179f25022 100644
> --- a/documentation/brief-yoctoprojectqs/index.rst
> +++ b/documentation/brief-yoctoprojectqs/index.rst
> @@ -424,9 +424,9 @@ information including the website, wiki pages, and user manuals:
>      development documentation, and access to a rich Yocto Project
>      Development Community into which you can tap.
>   
> --  **Video Seminar:** The `Introduction to the Yocto Project and Bitbake, Part 1
> +-  **Video Seminar:** The `Introduction to the Yocto Project and BitBake, Part 1
>      <https://urldefense.proofpoint.com/v2/url?u=https-3A__youtu.be_yuE7my3KOpo&d=DwIDAg&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=3lL8XKUkKw6z-VjGFtkt64aWO9M3tVc5JGfmvS5RcvKRQZ8C7UeVig6yaboueecf&s=_vJVr5l8K81UU7Js_Hv22GZrB1E7TlBepADZuR9GQJ0&e= >`__ and
> -   `Introduction to the Yocto Project and Bitbake, Part 2
> +   `Introduction to the Yocto Project and BitBake, Part 2
>      <https://urldefense.proofpoint.com/v2/url?u=https-3A__youtu.be_iZ05TTyzGHk&d=DwIDAg&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=3lL8XKUkKw6z-VjGFtkt64aWO9M3tVc5JGfmvS5RcvKRQZ8C7UeVig6yaboueecf&s=yCgILuDri4g-Wgrg_st7SOmWyMrTCnY-ocquh1q84dw&e= >`__ videos offer a video seminar
>      introducing you to the most important aspects of developing a
>      custom embedded Linux distribution with the Yocto Project.
> diff --git a/documentation/conf.py b/documentation/conf.py
> index a7cdf415f8..baf550e3e3 100644
> --- a/documentation/conf.py
> +++ b/documentation/conf.py
> @@ -19,7 +19,7 @@ try:
>       import yaml
>   except ImportError:
>       sys.stderr.write("The Yocto Project Sphinx documentation requires PyYAML.\
> -    \nPlease make sure to install pyyaml python package.\n")
> +    \nPlease make sure to install pyyaml Python package.\n")
>       sys.exit(1)
>   
>   # current_version = "dev"
> @@ -108,7 +108,7 @@ extlinks = {
>       'oe_layer': ('https://urldefense.proofpoint.com/v2/url?u=https-3A__layers.openembedded.org_layerindex_branch_master_layer-25s&d=DwIDAg&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=3lL8XKUkKw6z-VjGFtkt64aWO9M3tVc5JGfmvS5RcvKRQZ8C7UeVig6yaboueecf&s=ci0jiBhQiS7rKajQ-7r8Rg6BRSCZV-v-nv4Btg8fRLA&e= ', None),
>   }
>   
> -# Intersphinx config to use cross reference with Bitbake user manual
> +# Intersphinx config to use cross reference with BitBake user manual
>   intersphinx_mapping = {
>       'bitbake': ('https://urldefense.proofpoint.com/v2/url?u=https-3A__docs.yoctoproject.org_bitbake_&d=DwIDAg&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=3lL8XKUkKw6z-VjGFtkt64aWO9M3tVc5JGfmvS5RcvKRQZ8C7UeVig6yaboueecf&s=VheHWvTCqPdNXkAjSKfKoKx9D8TuOKTAK4B_UiK6vNk&e= ' + bitbake_version, None)
>   }
> @@ -129,7 +129,7 @@ try:
>       }
>   except ImportError:
>       sys.stderr.write("The Sphinx sphinx_rtd_theme HTML theme was not found.\
> -    \nPlease make sure to install the sphinx_rtd_theme python package.\n")
> +    \nPlease make sure to install the sphinx_rtd_theme Python package.\n")
>       sys.exit(1)
>   
>   html_logo = 'sphinx-static/YoctoProject_Logo_RGB.jpg'
> diff --git a/documentation/dev-manual/common-tasks.rst b/documentation/dev-manual/common-tasks.rst
> index b228c75aab..7108333cdf 100644
> --- a/documentation/dev-manual/common-tasks.rst
> +++ b/documentation/dev-manual/common-tasks.rst
> @@ -5392,7 +5392,7 @@ create the properly partitioned image.
>   
>   The ``wic`` command generates partitioned images from existing
>   OpenEmbedded build artifacts. Image generation is driven by partitioning
> -commands contained in an Openembedded kickstart file (``.wks``)
> +commands contained in an OpenEmbedded kickstart file (``.wks``)
>   specified either directly on the command line or as one of a selection
>   of canned kickstart files as shown with the ``wic list images`` command
>   in the
> @@ -5464,7 +5464,7 @@ system needs to meet the following requirements:
>   
>   -  You need to have the build artifacts already available, which
>      typically means that you must have already created an image using the
> -   Openembedded build system (e.g. ``core-image-minimal``). While it
> +   OpenEmbedded build system (e.g. ``core-image-minimal``). While it
>      might seem redundant to generate an image in order to create an image
>      using Wic, the current version of Wic requires the artifacts in the
>      form generated by the OpenEmbedded build system.
> @@ -5546,7 +5546,7 @@ Operational Modes
>   -----------------
>   
>   You can use Wic in two different modes, depending on how much control
> -you need for specifying the Openembedded build artifacts that are used
> +you need for specifying the OpenEmbedded build artifacts that are used
>   for creating the image: Raw and Cooked:
>   
>   -  *Raw Mode:* You explicitly specify build artifacts through Wic
> @@ -9214,7 +9214,7 @@ section:
>      to run specific tasks in the build chain. It can be useful to run
>      tasks "out-of-order" when trying isolate build issues.
>   
> --  ":ref:`dev-manual/common-tasks:general bitbake problems`" describes how
> +-  ":ref:`dev-manual/common-tasks:general BitBake problems`" describes how

I'm wondering if refs are case sensitive? Does it still work?

Cheers,
Quentin

