Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C866C43334
	for <webhook@archiver.kernel.org>; Mon,  4 Jul 2022 13:19:11 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.59])
 by mx.groups.io with SMTP id smtpd.web08.71863.1656940747606042366
 for <docs@lists.yoctoproject.org>;
 Mon, 04 Jul 2022 06:19:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherrycloud.onmicrosoft.com
 header.s=selector2-cherrycloud-onmicrosoft-com header.b=keKxugts;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.8.59,
 mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LM0ug56QcOSn+I8yz4rxkMqqF1ZPiVB8wAB9HmB50/Sxy0XTpYpWDwyX2nR1cK1OiEFrNvntZA+jfDSdHfMvYePadKpC6LSlH/sRrATDUGLeBfz/WsV/WU1iovGTwHM0k1ZiKOHMHfDsIYdTYugLjJERW+rqhzNFRWy3EH3Y1x7PqtTmWrRPYut6ksk/gvrwN264jBiXFPvn89Eyl50vWrjGYUKWYq3f1sLrKNbk+ztHj3o/5QMlejHg4OQPMWdyJ3DL+H4mkPSo2P1E4cIIJhgKdsW7gAy5Kncx62pUn17i4qxbX0OUz7EDcHftkDm//APRYQvQhge2m987URm2Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MUTV99K784McZvFsBcfWb2Ey9oLU6ysSW/g04OSdoCA=;
 b=gXQyDyUHO9YdtRrIZT2Jd1envUeg7vT6EhdcKGvzUrHOy/VSBwTKDNEgCdN16I0u97GwfBvcrMUcl1vqbTVgSEj4l/PLWO1vwfFR4u0oYCCgGD9JnJIMcOlXmPYY+8TZ5hWdDz5dAszrrwxJmBfW3DZCEFHaM45IdQeF7ywStDV5wQ+WhY0WPCONgxh1xsb8n5nenmb/czfcLNsjjmGH31hlLz5lPJYoiwg9Bq5+deAZqkl+t6oH9IRDU2UiPUZNE1hcGSdemmdJ/qo4/Zzxzw5dgkJir58Vs6JqC6eYoUKsO0MkGnt9gsTvPt50erXvNWa2PoDaJWPD+xvZohXkSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MUTV99K784McZvFsBcfWb2Ey9oLU6ysSW/g04OSdoCA=;
 b=keKxugts7/nwDQHwVG4i7yj+7es6EUEw/wptYCwrxDpANBSdLV2jENTDCkvgadab9+F8pBYNDfNRmvOhF97cwS1UVeR4ZZJu0CxfpBwgTBS1adU0BSNo9LqjquzNuT5cSHjjwWfwntd1gNHc60jbdNT9bel83YOKrRQDOTagWcY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com (2603:10a6:102:2aa::7)
 by DBBPR04MB7707.eurprd04.prod.outlook.com (2603:10a6:10:1f4::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.20; Mon, 4 Jul
 2022 13:19:03 +0000
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::cc58:11a8:839f:895f]) by PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::cc58:11a8:839f:895f%7]) with mapi id 15.20.5395.017; Mon, 4 Jul 2022
 13:19:03 +0000
Message-ID: <668d7c26-1aef-c95d-a0db-93a79db6d13c@theobroma-systems.com>
Date: Mon, 4 Jul 2022 15:19:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [docs] [PATCH] ref-manual: correct description of
 empty-root-passwd in IMAGE_FEATURES
Content-Language: en-US
To: michael.opdenacker@bootlin.com, docs@lists.yoctoproject.org
References: <20220615162207.1153708-1-michael.opdenacker@bootlin.com>
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <20220615162207.1153708-1-michael.opdenacker@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0103.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::16) To PA4PR04MB9367.eurprd04.prod.outlook.com
 (2603:10a6:102:2aa::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6dddfdb7-8c47-447e-2646-08da5dbfc3ca
X-MS-TrafficTypeDiagnostic: DBBPR04MB7707:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	jdOYQUMGiWBhgn5F9k1QS6tD2XjUz1AVZwjT+NJl+STew82a2GWP6rtGsprC83TIZIlPdSy6jW5UoV0VnS/D9MeO6FtQ3LiFBGI1I+Rdx/y0fqlPFEzbXMfdsNP6CphqOsenvTqbQG08QqGM9ncVBK678U9/iQY4WwzOMrUVlpIiwkxK9tucioH3Ed7ZAzhTuNpyGOLuyM5AH6Je28hDd00kWlmfp66GxyR8Yo3vUnfXbG/gU/6jt/r3e4jae/KiYcMCg0rkpoCvGb1MiuRuTgVRBxZ4H0KntjxEaTaL7LQbshuI/Hx6NS3ky8ybV7BybfgubqTk/gMTGzwt5IOcSHNXxZRxak9p9ylUa5QwiEEPpEkzBkcScaeoo0/F6jzLdPPDHoUzv/N1ETauSfujei/JSI6iS29qNuncUBlILTaG5/TpjaQ2nDTWvNxI71rC/qPMXrHSZBFSR2rrlJY5EjZIlTSnkRrT4MVNlIvSaRST26pLeYaV30Qfxyi3fcyxpMAx8yBUiYYA5ZvJ7ZzptgXnp5ETVhAz0SpfJUKYbPtpRdku4BRNqDhE9PA+V0d+X1KZ38owQc9Fi2gfrv0BN4iHbPeDkWIMrl2wlrE5G+p1rAFBalxUiIdBrfsxccO9qxNVBf0n4vmMFs+KDFo6Dj1ELVRrVovYUfsdxmAqm6aRI001K0Pwbhkhz8qdcbjJcr+0/rc6BqskKH28pig8Nw3ayDf/H/olHo0ST/F8+XIFvoCpFCsGBn+zbc+RKyFhWV+kCINqqiJ0YEePWh3yWqEJUPVX0VOcVFQ73/0OPmuJpn4o2caEMJ2WThmpAQ4ogSOR8NudwSbmbGbBQsekJI6o4bwPIPUNmdJiDC57tQM=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9367.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(39850400004)(346002)(136003)(376002)(366004)(31696002)(2616005)(86362001)(6512007)(6506007)(53546011)(26005)(186003)(38100700002)(83380400001)(41300700001)(478600001)(5660300002)(66476007)(66946007)(66556008)(36756003)(8676002)(31686004)(2906002)(44832011)(6486002)(316002)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?SFJaQ09QZWVETzk0WTdpWjA4ampPZDU0UWxwcXIrdEw5Y1l5a2FaT1kxWmJ5?=
 =?utf-8?B?Y0h1Y1pqWGhFNDI2aHE0cUJOYUZBZXFNNDFtZXZ5bERrTlRhV0RTV3liakVV?=
 =?utf-8?B?L3JuaUJHTW5IUjFacDNnbXVybzVNakdkOXZMdHVKTFp3dlFCa1dkZUJMRWRW?=
 =?utf-8?B?aXplaktmRG1TKzU4WmU5OHR6UGFGeFgzT1pYQUJobm1jc2ZzVGJXNUN6RTNB?=
 =?utf-8?B?RDZtOGFLTk5XRFFhUGQ5ZWFVMjlrZkdXSHlYMUJrcnB3c3lOYndmRklHbENv?=
 =?utf-8?B?L3VDbGdOV2JOMjg0Y1p2N1hxR2VHU0JXUzBuZE81ODRkOS9uQ2VJVHFjMEk1?=
 =?utf-8?B?K29LRUcvMVRsR0ZJRklDbU4ycjVIYjRFOHZyR29RMU9uWUczUnVFODlqUHZk?=
 =?utf-8?B?SzNVT0ovNzZWdHRoQ2JSOU9hd2ljelJqMFY3NUlhTmFDOU1NM0wxWFhNLzhM?=
 =?utf-8?B?d1ZOSVFXb2Y4bU9XNFZGRlRaVXNsS3A4U2FXNUk1UkNoYk4wK1FCOC9xNWtp?=
 =?utf-8?B?dXFTdm9NY1FOTllZNTBOUFN5eTZUanhzTWMwWlUxMG1zY0ZHeDIyeWs5L3Vi?=
 =?utf-8?B?S3pXM1UxazR0UEgwTUVDWGJiKy9HUmFDbTliVlZsUXFmOTFZUmU2V3NJOHZU?=
 =?utf-8?B?NUhDb1prTlpSRDllNHJHdGZtUFJscXMvcVBXWFlMV1FndVN1ZWlBdGplVkUz?=
 =?utf-8?B?SE15clAvYm9oVldSSVNJVHYya3RueVNvbUFyVThpU2FJRmVHamRqeGxZRk55?=
 =?utf-8?B?VmRjeWZsTjRkOVljZU1pMG1lMk1FQm1zWVVYUDhwclV2YThXRE9jT3hVaTFx?=
 =?utf-8?B?SWFzcTN3enZkN1c2czJ5VlRSNXlXa3NUb240ekZvMWYyR21pSUZtbGJZVlNV?=
 =?utf-8?B?dk0wY2QwREhPdXRoNTR2cTkwQVAycXdlRFg2QXNQNXg0ajRwOGZ6V2x5T0lC?=
 =?utf-8?B?Ynk5V0xWWXVOMzNGMGtTaEw1SDUwY2Fza0RwMGNMSXB2b0ZMMEo2L1V2cWlv?=
 =?utf-8?B?TkhZQTFEa3FUT3RNbzdXSXdDcnR6TzlUTVNUMkFvNllIcG4wU2hMOTBESlJv?=
 =?utf-8?B?UzRkQXd0eVV3VDlqYjlldStRYnBIRlFKTEZFMUlvaVNIZ3E2NGQzaWIvN09T?=
 =?utf-8?B?NFp5OFBhOTRTTnBPN205UVVCZ3M0TmtkOHJjUzdRT3FJcU8yak1QRVJBMHNI?=
 =?utf-8?B?OHdKem16ZmRWK3FoQmlORDlxdmUyT1VsOWplVisxcVZaUUJTZy9iWFF4WXFV?=
 =?utf-8?B?VnJEMnhtWkVCaENKek4zUFhRQW9IbDlVejBpLzJTbUU5NU9pYmhJQnFxaXNV?=
 =?utf-8?B?d0JEOFVsMnVEemRyMFZKNERudVBKbnpEUVhjMFRpbkovMEFHaElXalY4SkdX?=
 =?utf-8?B?Qmw1eHIxT3lPbk5HUWIyRndNdmg2Nlp0dUNVYnMwR0h1UExOV0U1dytQVnpU?=
 =?utf-8?B?QUUyWlJvSFJQRTR6Tjd5SUhLSEpyMEZiRU5JVlpOamZOUG9LQWl1cEFQaVdZ?=
 =?utf-8?B?c2lHa0RoQ0RGbEdFV3R2bnVKVE51dUtOTEE3VStTQzRpOGRzbWdXRW5FMGNq?=
 =?utf-8?B?QXE1bUh5M0JMMHZ1NmsrR1EwdDg3VW1iQ01wM0FPVlpNQ2NMQlc1dUNBZ1oz?=
 =?utf-8?B?UTB6ejErc3ozb1pWeGJsbUxMQkZ6T2tab3lIOEJzSEVtZWY5Q0FMWmJVRnBX?=
 =?utf-8?B?cXJWKy9hamswUm95clgwQ0hSWk50bm9oMy90dUx4N3I1a2s0TlY4WFFOR2JJ?=
 =?utf-8?B?dHE4a0tPeHNsVit0bCtya21uaEhkbkp6dmhKN1NJVmNleHhka1RJSWlVOTFy?=
 =?utf-8?B?SVMzM0NoTjZuWGd4aDlrVFBHZHA5dENlZHIrdlhUZmZBMXV5Yk13WUhScit1?=
 =?utf-8?B?QmdCbkpGVVEyVU9uU3oxRVEvNCs0NTFJY3I2RXAvUmc5S2RjNVJaSlU2WGZB?=
 =?utf-8?B?WXh1MkNRWk5Kbi8wczFtejQzcnM3NWdzWVo0NGFwVGF4YVZGRnRzNlVDV0NP?=
 =?utf-8?B?WjkzUXlaRllVQlpwcVZBTndEVEs2UC9rOURuOXNXSnNjOUFycUtYTnp5UkFU?=
 =?utf-8?B?UmlXc2N2cllrbWdBSTBaMTErS2FrUHh4QTVzemlNWC8xMW1yakxpaHo4ZHp5?=
 =?utf-8?B?a2k0ejk3TFlia0Rpem54bHgxS0s2QmhaZnVYQmliV0hKSlFuYmVYQ0l1enow?=
 =?utf-8?Q?0t16cP3fRSL/tHWZJjmdTsA=3D?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 6dddfdb7-8c47-447e-2646-08da5dbfc3ca
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9367.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2022 13:19:03.2538
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 xZ7d6aTZ/zoHhV4vJpVpTx9wAJEM8DuhCaCe6Ve6WGHEPxEpcbacJXW2uuvjMx0Q4ru5BzS5r8XEkSh1N1CIchtAo13EpkjdBjNmFpudb58D/8iAkU9Zk6EcA1dwGsCV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7707
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 04 Jul 2022 13:19:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3047

Hi Michael,

On 6/15/22 18:22, Michael Opdenacker via lists.yoctoproject.org wrote:
> From: Michael Opdenacker <michael.opdenacker@bootlin.com>
> 
> "empty-root-passwd" doesn't actually set an empty root password.
> It just doesn't touch the initial root password which is empty by default.
> 

I'm not sure we should care about the implementation details in the docs.

> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
> ---
>   documentation/ref-manual/features.rst | 15 +++++++++++++--
>   1 file changed, 13 insertions(+), 2 deletions(-)
> 
> diff --git a/documentation/ref-manual/features.rst b/documentation/ref-manual/features.rst
> index f7abb417ba..76bb3bceac 100644
> --- a/documentation/ref-manual/features.rst
> +++ b/documentation/ref-manual/features.rst
> @@ -216,8 +216,19 @@ Here are the image features available for all images:
>   -  *doc-pkgs:* Installs documentation packages for all packages
>      installed in a given image.
>   
> --  *empty-root-password:* Sets the root password to an empty string,
> -   which allows logins with a blank password.
> +-  *empty-root-password:* This feature or ``debug-tweaks`` is required if
> +   you want to allow root login with an empty password. If these features
> +   are not present in :term:`IMAGE_FEATURES`, a non-empty password is
> +   forced in ``/etc/passwd`` and ``/etc/shadow`` if such files exist.
> +

I guess the two important pieces of information there are:
  - debug-tweaks enables empty-root-password? Can we add this info to 
debug-tweaks paragraph/section?
  - if neither are set, a random password is generated during build for 
the root user?

> +   .. note::
> +       ``empty-root-passwd`` doesn't set an empty root password by itself.
> +       You get an initial empty root password thanks to the
> +       :oe_git:`base-passwd </openembedded-core/tree/meta/recipes-core/base-passwd/>`
> +       and :oe_git:`shadow </openembedded-core/tree/meta/recipes-extended/shadow/>`
> +       recipes, and the presence of ``empty-root-passwd`` or ``debug-tweaks``
> +       just disables the mechanism which forces an non-empty password for the
> +       root user.
>   

I'm not sure this kind of information has its place in the docs?

Cheers,
Quentin

