Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 201E9CD37B0
	for <webhook@archiver.kernel.org>; Mon, 18 Sep 2023 15:14:26 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (EUR03-DBA-obe.outbound.protection.outlook.com [40.107.104.54])
 by mx.groups.io with SMTP id smtpd.web11.54095.1695050064281433191
 for <docs@lists.yoctoproject.org>;
 Mon, 18 Sep 2023 08:14:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@theobroma-systems.com header.s=selector1 header.b=b5AJGkai;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.104.54, mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q3vHEMawGh+fCpjLtySxhoHAKDE5EXovlFz7sz08WpVilJ3GAHMgqpglF9eW1RBl2BW3FbUbSD31vC7a9Mj8ssumjLuuvOj1aJliT9/Bu1SygB/mk0Vo44DM4ZrVvZWgGJzZESCcwM3NMO2Ovheli59f2XJf5v1G3IVOiBMCe2jQNGO4oMN9ceq9ja5mZnULOGoLZoUuRNkPi8NPgrWEt1lkID4+pFHtNuqJWNFVXBPmlUhSz5qm8PY6p1FrNBqTdaR4HL62KzedgSb390oc4j6Co5P5arvPacQ997YYEehCw/Xm+XHT+dKNw7HcRapbSfgXcOnLglOuEz1uQnIN+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ie7fQ56OLjv3PNn1j9UjTX4/HQlG8kkCbToxEvHV1LM=;
 b=OSaBE8upb2q1bNP/2nwse+tHzpwWdbW18s2DY3H/PJNycJGoL7znFjiRfxqSRQAGareQaNCy43y7BWR2eZcINQLycb89bMsTHID/Jo/yfrWyWBJIKhg/+hhqnnksokeu1Gsk2/wrC/aC2sbzixr9LSJCiVocGAk/nLAOyDP0l6VQDHtXTIGKgH0ynmEbxXwy8+4LqMFvkyM99+qVImV2TjPSTMJ74JKEhf5nZJILz6yWGPNzEyoE9DpL2pbI48V/BP2THyigjehuGgVTQe6qf5XARCF7Er+R5uWM35dfxqmNty1cvp8nQgw2rIn3d4pYJj5g485jHGCzPm4AiIsDbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=theobroma-systems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ie7fQ56OLjv3PNn1j9UjTX4/HQlG8kkCbToxEvHV1LM=;
 b=b5AJGkaifXe3f833t4FHBkmdE8WPEHGUbcbIf1aDBvGuAwFJNXkUvD3Q6jJDIWyXwMtE7/t8CDjowRIRrF/n+xLdwO7TTtA5UHeCw4a5IZ8TZeT8awLCtMZ6DupYerAgiBK+FxPpQPro4XuWtDaDqJuo/0HuFJ9LxUEmG7ckyJQol+psGZuJsW5nweLe+ppNWSUfPgxAQFLWwbjHdr8JW/bVVXPW/d/PxL81EVHQltRDpJbZROm820SGUwr3fZWgOd5Geh/ai9rvIhJkqgXgxVTbfEPYBXEGTNdEsbD+3wFoLxozOlB3rMNaowlzEcvOeYLgUKbsVKmu/9kcJlufXQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com (2603:10a6:10:2d7::10)
 by VI1PR04MB7183.eurprd04.prod.outlook.com (2603:10a6:800:128::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.26; Mon, 18 Sep
 2023 15:14:19 +0000
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::5c00:6152:6ce:72b6]) by DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::5c00:6152:6ce:72b6%7]) with mapi id 15.20.6792.026; Mon, 18 Sep 2023
 15:14:19 +0000
Message-ID: <c98cbf98-0335-d559-6673-7348b4e4295c@theobroma-systems.com>
Date: Mon, 18 Sep 2023 17:14:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [docs] [PATCH] dev-manual: disk-space: improve wording for
 obsolete sstate cache files
Content-Language: en-US
To: michael.opdenacker@bootlin.com, docs@lists.yoctoproject.org
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <20230918150916.486857-1-michael.opdenacker@bootlin.com>
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <20230918150916.486857-1-michael.opdenacker@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0064.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ce::16) To DU2PR04MB8536.eurprd04.prod.outlook.com
 (2603:10a6:10:2d7::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8536:EE_|VI1PR04MB7183:EE_
X-MS-Office365-Filtering-Correlation-Id: 7549f9af-872e-43a8-8ad9-08dbb859edf4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	59FWCQ85ZzPqOVzC0fQj8qdgdifApCT/kjCe3BRmQUkqPoa/WZVypz6hGNHUjyI7mAz/TjyucsSvbdXDsl0Q/8vlFazQe13JF/7huPQAXWOMcCKbRsJ3iJsTeJFaLb+ahJXBSTY1z30fQ7ox4VMjcUosXBIcONomlgDp3e/Z/164MZS5JG5WWyENot3TikKA8dZ/OEsedrTrg0bHHTbvwdLp6nhrIIZwaBvSXa8qKDzLurFvjkpW6/8szwkn9p/b6v2yyGUxQwpzYy7HYVv3CqtWWGo/HxDB+MfLKUkRQLVf2X5jdR1a1OtVFbQP8Nq85ujX4WjGLA17YB0k//oT6UhDvjgYT00FG2BZTFeByJ75r3zmgux4v4KMtcYtQtOfxtF1XYyyYm9WNjlhDEWtD9xb9y9afun1XXBFHczrLstI3LTGVB1u+zyo4GTYcaru/ybfM4HiE4tr5ICAiovBVngUlbOxKzQLRrxJ7KtPXQhbKygfNum6lnWK2vnVM1luijT17G7Mxfc5u2+KvV5vJcS9hJyjgYjOWQD4a2DSsrOSDKWUqDRfGkayzWa3wiuzWYv3pSdUgp+4ZGRh8s+B9Cs4irMFjniRY4CfPlRQO23KNVbQ6Gvxv+Kbq0lwUhGDXs1Ef/0iS26om0HlZ/bF+g==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8536.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(136003)(366004)(346002)(376002)(39840400004)(186009)(1800799009)(451199024)(53546011)(6666004)(6486002)(6506007)(6512007)(83380400001)(478600001)(2616005)(2906002)(8676002)(44832011)(66476007)(66556008)(66946007)(316002)(5660300002)(4326008)(8936002)(41300700001)(86362001)(31696002)(36756003)(38100700002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ejluK1ZvK0hwZ3lxd2pDK1l5V0xtUFEvc0hWT21UeitZcEhLZTY1K0VlMUdP?=
 =?utf-8?B?U0NnRkZtS3FsVHNwTXpmTmFLV003cG95TmJSWlhYTDdXUUVLZW4wRVNZazVa?=
 =?utf-8?B?Ukh5RStMbzgwWHdvQkpRc080bVBWQlhhUE9GbjRxam4wNUlIVVExUm5ta3Zk?=
 =?utf-8?B?dkQveGx0WGtMSFVobDZMc3lIRWp4Rzl2VmFqeXVVWlBpVWVCc0dtOFBhOXAx?=
 =?utf-8?B?aWE4UVFyR0FWOGZEZVpjOU5TMDJUZUVxNnlqUkNhOUJjNTZNQUlTL2E3dDEx?=
 =?utf-8?B?R1RmT1lrWnRFclRaMlQ5MmJtK3pFeWJ3WVAxRzNnRlhRL0FCa3J3elJaUW9Y?=
 =?utf-8?B?WU1uUEYwOXJ2cFM1djFKQnp1OEtZRDVIckRKSHdvWTBuOFphVzN6UDVlZnFh?=
 =?utf-8?B?ZUJyUEU2alZOV2ttL05UUGRTQmxhdzY5L0FiM2pPWjFjY2JQaEIxSlFkWkVV?=
 =?utf-8?B?T2IrOEhkVVpWZ2VWNGZsUU5hTkF0WTg5Uml0Q3dJNG82NTZHVUIxZFJxaUdZ?=
 =?utf-8?B?czVvL0FSZTNNU1dSaG1ReW44L056U1JPVjlmYkNUK2dEckk5K1JzaVZLbXdF?=
 =?utf-8?B?MjJ4NDZab0dDTkpkcjc1MjRVVFhvMHFVamcvaWV3VTNOaG52RC9tVHMybkoz?=
 =?utf-8?B?YzFOQk50eThtYzlaclEzZ3UrTEpVZjlBUmtMcmIxT1dNSGlLRDhEbE1kQmlV?=
 =?utf-8?B?eENrRjI4Z0UyR0dmRkVYclhId1dUdXIrUWc4UjVVT3BYeDQ1Y1FzTUE5RDkr?=
 =?utf-8?B?QktZMXF3ZGdxVG9aVktmWCtSaEtSV2tEYTd2MUJzRU5mSE9NRlJtWDh3MlFw?=
 =?utf-8?B?MkNFa3BnUEN4c2FMS256bmtBbkxMa2ZOVFdic2ZEVVF1MWJWcmQreTlkejhL?=
 =?utf-8?B?aTIrb0RnTStudjJnWXV3bTJ0WG9lcnpSdVpxZm0yamNRTTBXaGREVWhJZzZC?=
 =?utf-8?B?RkpFbXA0YldmSjhmL3dINXIwZmMwVE1QSmVwTjd6bEdaVW1nK2ozTlVQaGZF?=
 =?utf-8?B?YXQrYUs2OTRMQnlDVlMySm0xbXFUSVZJZWFXa0c4ZHZXYUViRlRnZXRsTHdr?=
 =?utf-8?B?anFKRVlsdDNJZ09CbGtMNmlNWTZjUDQ3Ry9LdUJyeGYwUmJPY2J0djNBS0ht?=
 =?utf-8?B?QWxSSCs1cHM3aEU5TlhpNkppQUF5bUJuQUFEUjdqMGRpUHdXRDkwVSsyS28v?=
 =?utf-8?B?ZUgyK0R5WWU4ZEo3aDJDT2hkZHloRExlY3hrVTg5K1JiMXFiRVpGWFJ0Qnh5?=
 =?utf-8?B?bzBiTTVrbCtRS3doK2NMQlB1SVhGcXk2cXBaL3RzcG1ERU5QaXBuUGp2V2w0?=
 =?utf-8?B?YlJQdlg5TGdPZ0l3V0pXOFhWMTB2TDhkdlJMWCtVQ1I4R3dkOUxQY24zTEhn?=
 =?utf-8?B?NzFmdmFKbk1tb1pWYjFFejczdnBXU01Zbk9sMUZLTkJ5TDNkK3JER3NES3B2?=
 =?utf-8?B?K1p3ai84UTNlZVZxdS9jcitEdTE4YlREUXQrQTh1QWJHWlJ4czJDTUhZNkdo?=
 =?utf-8?B?MUJkWjFUbmN4RDRWcExYeUdsd0NaZjBpVVZOWTdPbk5YbmYyNWdVMTlkNW9Q?=
 =?utf-8?B?blJBSXZNc2xaakpUY3pwellsbzRQcWpxUjd3UFh5SDhqZ0pINy9KMEZ6dzNV?=
 =?utf-8?B?bnZ2R1dieHVmTHRGNlFvNVkybHpERzRhZ2NOMk90bFUzYmh4MHUvRGNrWmU3?=
 =?utf-8?B?WkhuaWsvNFAyYnU5L1pENzltYXVnanlxZG5veWpVTTlORzRyVDRGU1M0Skhp?=
 =?utf-8?B?Qk8zRjA4NS9LTXgyTHgyazV2dnk3R1ZTUWVPUFBrMDFmNitYY3NNK1NCL2RC?=
 =?utf-8?B?V0hHUEVZaFM1NDVVaklRZzZjRVlCQkpyVDhYdjh5QlF0K3IvUVpTZmI3VDVx?=
 =?utf-8?B?RFJOekdDeHB3NFJHUlNRVERyY0JBYWV2MzNLMjdjK2FPNy94d2R2Z1JTc0pj?=
 =?utf-8?B?UFh2UERnU1JNUFBnQVNHeXc3LzJERHNkM1lHclF4aUpEUXBEOXJtcFUyRTB1?=
 =?utf-8?B?ZGNxREJwbHhldVEzZi92K25QUy9UY1ZZMUxHbUdkOHM5THhXSXFZZWpmbDNn?=
 =?utf-8?B?VS9tWldsbEJua0NhOGtDRE1MaWpETUNsanI3d1RRUGMrdHhLVWZ2V1RWajNU?=
 =?utf-8?B?dmNCRWVVZlE4b1lWWFdISFpvaDhEQ285TldjblVxZXIzWVdWTGkzcUkrdWJ4?=
 =?utf-8?B?ZW9VYTl2Y0tEQmU5RjhIV3B5QW1YTllLS3pQUWhwaFM3SjZDdDJDNXV2TG5m?=
 =?utf-8?B?Slh0cFE2RmtNT3lVelBQU2lJMEVnPT0=?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7549f9af-872e-43a8-8ad9-08dbb859edf4
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8536.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2023 15:14:19.0937
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GT9yW1qXtglj0AH3UHv3GcvUqB8s7RBVuIvO5at807fzxwSjrF9MD6Q7BB1M0TQIvWiYxfxrSi3VHvfIU1769PLpwQj0Is9a3mCxXqIc7+LhDbkbt+BiFvBYHCmCCXYS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7183
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 18 Sep 2023 15:14:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4225

Hi Michael,

On 9/18/23 17:09, Michael Opdenacker via lists.yoctoproject.org wrote:
> From: Michael Opdenacker <michael.opdenacker@bootlin.com>
> 
> Replace "duplicate" by "obsolete", more appropriate.
> "duplicate" probably comes from the "--remove-duplicated"
> option of the sstate-cache-management.sh script.
> 
> Improve other sentences too.
> 
> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
> Reported-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>   documentation/dev-manual/disk-space.rst | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/documentation/dev-manual/disk-space.rst b/documentation/dev-manual/disk-space.rst
> index a84bef4511..5b6702f594 100644
> --- a/documentation/dev-manual/disk-space.rst
> +++ b/documentation/dev-manual/disk-space.rst
> @@ -23,12 +23,12 @@ final disk usage of 22 Gbytes instead of &MIN_DISK_SPACE; Gbytes. However,
>   &MIN_DISK_SPACE_RM_WORK; Gbytes of initial free disk space are still needed to
>   create temporary files before they can be deleted.
>   
> -Purging Duplicate Shared State Cache Files
> -==========================================
> +Purging Obsolete Shared State Cache Files
> +=========================================
>   
>   After multiple build iterations, the Shared State (sstate) cache can contain
> -duplicate cache files for a given package, consuming a substantial amount of
> -disk space. However, only the most recent cache files are likeky to be reusable.
> +multiple cache files for a given package, consuming a substantial amount of
> +disk space. However, only the most recent ones are likeky to be reusable.
>   

s/likeky/likely/

s/reusable/reused/

?

Cheers,
Quentin

