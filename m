Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC31CC54EE9
	for <webhook@archiver.kernel.org>; Mon, 19 Sep 2022 15:01:21 +0000 (UTC)
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (EUR03-VE1-obe.outbound.protection.outlook.com [40.107.5.45])
 by mx.groups.io with SMTP id smtpd.web12.104.1663599673343562191
 for <docs@lists.yoctoproject.org>;
 Mon, 19 Sep 2022 08:01:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherrycloud.onmicrosoft.com
 header.s=selector2-cherrycloud-onmicrosoft-com header.b=fsY/K9lH;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.5.45,
 mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z99ZxtoCs/aASayoFaaejSlO51xmZ+XFoiD7/pHq8A2XjD28v61WpcgMqagjz5BsC2fMhIDBxiWDgx9VGemwDBhdW9HPjayeMRYZieyAyyw5GYHwG19QVLobzvWhWOeDCX8OC7bvSWFbbWeR4H5iQx4rmPNhuM2KHrp2JBafAL7eWtng5b4QbgvqwCKSWLM6RXBPoOZ1uiPHikMw+nyPXSPgzi51fuQc5uuWNNzLEURGTJrWQF6/eJiuu4/p0wW3Lp+HOZSubfDNq6+OhLIjZJFDsfUn/N7r0Me2sDh+DJi9Ziewp4F+q+K/k5iLJnBb8iXpQBdn5JTtn9SsC3Ao/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t7wrFVX8JHx+V/upqnPvndZBElHRmhMKPS8oi0UW3+o=;
 b=bGWojRLJugklKDPRXD8BFxeUYKR9lkneOxr/+t0jrnMazIKFOle7KLBA5l8mxpLui00l6Z6bI8/pN816Y2el6Gydaz5xGx/hmlkSc2Ez+0MktkIHPphLfVA10tU6G19FcleprSX/7DMHtiBzPQFkLi11kdoKSWRSaaaChBbWXEYas34A3xy5yuYoABRbOWCpTtnqaUfKXmFCOT63TKV5D9lUWNTQvgZda3e6qFBitdXSrmnmwJw/bQ/vxgz/vAK9xkdt5mm5vHXq8/u8UtzK854MJBSW6hNLMb+xvcsGmRDm3DyTrra4oFnSSXc1WYe2pah2wwkSnldK5+oV+B2fYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t7wrFVX8JHx+V/upqnPvndZBElHRmhMKPS8oi0UW3+o=;
 b=fsY/K9lHcpuKk8vv18e4B7sV73vOob67WpgG9v5sc+ZwnzW7AM9/CZaifkwP11Gd5dUk3wbyVjUYTepLvBNSneTT4fmoZ4XAqolNq6kkTGWy6KALCWBi27+5c+OSb+TmAEfyA/ocCsY4q+hZCbQodT2Ez6JJ87yfRkPLLJLnjsg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com (2603:10a6:10:2d7::10)
 by AS8PR04MB8401.eurprd04.prod.outlook.com (2603:10a6:20b:3f3::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.19; Mon, 19 Sep
 2022 15:01:09 +0000
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::5e5e:1989:e5ec:c833]) by DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::5e5e:1989:e5ec:c833%3]) with mapi id 15.20.5632.021; Mon, 19 Sep 2022
 15:01:09 +0000
Message-ID: <2d0fb2ba-38ec-a8d6-cad6-f0699f756db3@theobroma-systems.com>
Date: Mon, 19 Sep 2022 17:01:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [docs] [PATCH] ref-manual: variables: document KERNEL_IMAGETYPES
Content-Language: en-US
To: Johan Korsnes <johan.korsnes@remarkable.no>, docs@lists.yoctoproject.org
Cc: He Zhe <zhe.he@windriver.com>, Ross Burton <ross.burton@intel.com>,
 Richard Purdie <richard.purdie@linuxfoundation.org>
References: <20220908161333.96614-1-johan.korsnes@remarkable.no>
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <20220908161333.96614-1-johan.korsnes@remarkable.no>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0055.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::18) To DU2PR04MB8536.eurprd04.prod.outlook.com
 (2603:10a6:10:2d7::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8536:EE_|AS8PR04MB8401:EE_
X-MS-Office365-Filtering-Correlation-Id: 43b60e02-01c8-4d89-2c97-08da9a4fc936
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	78+IODrlhJgV6yP3E4vd5QHP77VjLJu82i3kxFGzmallZBGvTxEiTLdGG3wDjR8kiZ/bxUmPMAgCeYuvQW3uQTLeysndC7BybUgYLlqFz9XLpMeHEqLAINFLzxcBQQPdoS/HmmCxbVqdfUDKa6QCq56RtqLIFGujxPvNbmKFI4vBQ2Q5eR1yKD2vWwP97fjYugPhLiWRth7U9ZbYKRPB8QJDrc/miTxFVcZgTzgRWhNH3tiIamkDr/FdK3elNpwYY2GPyYf8uXO24LE8kMyXm7VWnRDuCPwlbfZMvl9l/zW0fuAxusBt44rtiUSqG6xFNauIT0zbIIedvU0z0viGGMKS/GkorKT8RNKxGp8AtnrLYD81ML7JnNL4n/Rq+/RX3fLwRvCOSKp3N1WyuqJ/wg3kxXPe/jlMU6K8nH+x/JpoqfmfeVCoT5L/0ombsptP7v1DIHdUH9ci0/oPNvlFvyyi+V84zgJ0KGgUW2uSn9JY/2FHSYbzWcV3azILttv0E+KeNgLGMl7FniO7jFoNWsgfUvFb1EyzJyqHgeJntnYD+FdctkGwdn+lTF5/ihUhjLc63CQcIZ8j7q0d5kgrBs3S96JoThWQo/m2aquL9IpUgWkJXlWdj6+W4DQIFxn5zHJ9JFk51SA3BckM5CbmbiCTsO1PyVOONJFnL2q+maxXvQFXN6IegPVxc5RiSbW0fsPps7E5vrOwf6BE9zVEIoR8VSHb5c3KNPKItlxGHa/qBifzcAXRPI0wR5ix97w5JpnxrbucjHqHSOrx4DdmMFGuiqcrlT9I5OuBaw15H8Y=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8536.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(136003)(346002)(366004)(39840400004)(376002)(451199015)(36756003)(5660300002)(31686004)(316002)(31696002)(86362001)(38100700002)(54906003)(2906002)(186003)(83380400001)(6486002)(8936002)(44832011)(2616005)(6506007)(4326008)(53546011)(6512007)(26005)(41300700001)(66946007)(8676002)(66556008)(478600001)(66476007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?NnEzTnEyZ1FLdGIwMG56SDIxeW1uSStIOVNmSWVRWkRQa1kwLzFQUHdnVGti?=
 =?utf-8?B?STBrVzl3M0tBMTNFRFdXL0VNZmQ3Q3dLeGNGd0cyNE9UTVNMWm1pbTlhMjJY?=
 =?utf-8?B?bEtTYS9KMVNXUEtmb1h3ellPcEtEbG9uQ2lQaURReEtxVE5tK2poaHhzc0Vs?=
 =?utf-8?B?U0xwSnY1V3NkSkk3bE9OdThVMmhraXRFNkRyQ2VjclV1Z0Y1Z0lQSUcxU0xp?=
 =?utf-8?B?Nkp1RWt0VWg0UG1FZXFhRk5weUQ1YnZOTmgzaDE4Ti9HdWIxV01wZ2puWm9N?=
 =?utf-8?B?NkwzdngwSDFTaVJ6Y0gycG04UUU1YXFoQUhVT0pIYk41eVJ3bEN3VzdiRDF4?=
 =?utf-8?B?RDZSVUhwNDg1d2tjQWZrUDlEV1lGVE12dVZtMlNiNERqUVpsU0hMOVc3ajRv?=
 =?utf-8?B?bEFXZldKdG5JOVRWT29kSEw2WjdlWk5xbVV2TjQ1MXliNGtnOENsTzRhODFO?=
 =?utf-8?B?aFlDNmNaR09peVI0U2hVUmMwbWVBQlNjS1J4UmdadE0xK3JQblNBVEpRa2cv?=
 =?utf-8?B?bUkzK3J3QTd6ZXlRRmRkREFpVE42bXFlUEdETWpnNmhlWEtaUlBXcXY4MEIz?=
 =?utf-8?B?N0FkYlNtK0JnUUozTGZqOWtYMVhTbWVtQUhidi9OUDVraDFhdVIwWGNnZWZJ?=
 =?utf-8?B?M0RoMlp1T2M1cmxyZXoxSzNKeHVWRGVxM2ZVNC9tK2UrajBUZVlCTTFvclFa?=
 =?utf-8?B?eUNNUVFvYjhjQ0ZaTFJkMkoweU9MMVZnU0Fvb2pyUE5Ddy8vSjlpYnJBM3A5?=
 =?utf-8?B?bEtkKy9CV2ZKSDBYemRuWWVEYWg0UkFtUmFZNllGMm9mdC8xdTMwektNWnhC?=
 =?utf-8?B?S25BYkdKenhXZksrSlZOQTVzejl2cmNzRDNHelZRWWlqZ0NCWFB5SjRMdTNP?=
 =?utf-8?B?eVA3U2k4d1VwVGIzM0EyZ1Vwa2JkS2lIZUoyc055T3dpaVFQZ0xEc2tnQktp?=
 =?utf-8?B?WEJEWlh0MGtJd2hwRTdKRDAzTXUxZlZEY1pzeWkzZU5ibHc4MkxXQXJPNWFq?=
 =?utf-8?B?dzJRTWhCakFUYkNhRU00WVlsa0poQ2c0cHdkbnAvcnRCUnZ4RDFtM3V0QjBJ?=
 =?utf-8?B?Y3ZON0R0ZGgzRGxCSFVMWnlUS2FEdE4zZS9pWERKVHlUUnBhR2MzZVlHYUt3?=
 =?utf-8?B?YktDSnp2Smt6V2tpbTFpVWR3SDFQNjA3aTNCUTYzOGI4NGhQWjE0Yk4rNnJO?=
 =?utf-8?B?eklMZDVaTkphUWxSbytud2Ribjh1WUJjL0w4dHc0aUFlTEFaMUtXeElnSzJD?=
 =?utf-8?B?aVBDWThlaEtoR2xocHMzTkZ3YXpoRHB5VEcvMk91MW9mbkN1YTVUTDBnVGZJ?=
 =?utf-8?B?NjlKODRaUzBNdHVGSDEwalNxTXhDMnYxU1dGYllURU9ZYjYySzd6WVEzNkRa?=
 =?utf-8?B?VmR6OGhEa3c4Uk50Sy9UcXV3TCtHK0tEVFdkeXhTK05SMmpldFV1UUNheWRj?=
 =?utf-8?B?OGhDQ2ZQQW0yb3dzZHMzM05GelMzRFhaT292WlV4T1lIbWtsRGJ5QWhJK1FX?=
 =?utf-8?B?QjQxWllId1hGOWFUSnJ4dHFraW4xZmVkMGdUaUhjbmtpclBXQXIxSTJESVF2?=
 =?utf-8?B?SHJvUEJ3N2R0dlBqOFZ6dEhBTVE2RzFCMmttKzVDNFlmWWZkcjlEMXJXdnlv?=
 =?utf-8?B?YTJaYmEzVjZXV0tkdm9PY1VMeE5oV3ZmUXk1TWU0cDJOSVJ5NGVwTjFRK0kz?=
 =?utf-8?B?NFVXR1dQUGU2RSswM3IrbnNGdkltNmNFc2dVcVptcWxtOHNBa3M3YzZ3TVRr?=
 =?utf-8?B?RjF1VkVWY2VwN09kVVltUGp2RGNmQjlpN0xsbHFDcGZKYzcwdXRRUDNaVXBC?=
 =?utf-8?B?YnpkM1hXdnJ1b01VNXNBWldRWVMxYmZFc3VQR3I1MTZKZmJsbWFxbDllQWdM?=
 =?utf-8?B?bGFTcDZwZ3hsbk5IUnZWUWY4UDFhcXY4bWZTa25IVzMzRVN0OEc3N3RpNFpM?=
 =?utf-8?B?b3VCaDNQWmlZWlBFbVJ2TmNkdkxtMkU5bjhxb1ljQW9jWEtPVGpNelNNcVdi?=
 =?utf-8?B?Y3NFeUJTNklwVDlhUWxpUDRtcTM5U1lRWmJKUmV0VkMrUlpSZHFNT2RzSnFw?=
 =?utf-8?B?VWcvdUduVUhFWFAzdERMM0dYWlgybi8vSGZmODdYMzVNMXE1M0RiWkRNMmVp?=
 =?utf-8?B?ZXhEWFVYMFZLZmxScFZZU2wrRVpNYS9BVk9EL2VIMjlSb3NqZUtIcVhCbDJZ?=
 =?utf-8?Q?25gmfnscwTXHH3d95xlA4q8=3D?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 43b60e02-01c8-4d89-2c97-08da9a4fc936
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8536.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2022 15:01:09.6773
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 LGtR1BgkaXkL7LpvhJLGyU11oYF1VY99AzC6qz7pLbBUBY71HbQXqTbZWxf08LNTXLCbNEAd5BR81qOnVZmaVuNaPSKqpSxHcVnBi2GYwBKPaO+VZMln7zSWny9u2tqo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8401
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 19 Sep 2022 15:01:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3171

Hi Johan,

On 9/8/22 18:13, Johan Korsnes wrote:
> Cc: He Zhe <zhe.he@windriver.com>
> Cc: Ross Burton <ross.burton@intel.com>
> Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
> Signed-off-by: Johan Korsnes <johan.korsnes@remarkable.no>
> ---
>   documentation/ref-manual/variables.rst | 13 +++++++++----
>   1 file changed, 9 insertions(+), 4 deletions(-)
> 
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
> index cf817e954..59a474f30 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -3984,11 +3984,10 @@ system and gives an overview of their function and contents.
>   
>            KCONFIG_MODE = "alldefconfig"
>   
> -
>      :term:`KERNEL_ALT_IMAGETYPE`
>         Specifies an alternate kernel image type for creation in addition to
> -      the kernel image type specified using the
> -      :term:`KERNEL_IMAGETYPE` variable.
> +      the kernel image type specified using the :term:`KERNEL_IMAGETYPE` and
> +      :term:`KERNEL_IMAGETYPES` variables.
>   

I'm wondering if we shouldn't retire KERNEL_ALT_IMAGETYPE since it's 
superseded by KERNEL_IMAGETYPES? Not something for the docs though, code 
needs to be changed first.

>      :term:`KERNEL_ARTIFACT_NAME`
>         Specifies the name of all of the build artifacts. You can change the
> @@ -4174,7 +4173,13 @@ system and gives an overview of their function and contents.
>   
>         If you want to build an alternate kernel image type in addition to that
>         specified by :term:`KERNEL_IMAGETYPE`, use the :term:`KERNEL_ALT_IMAGETYPE`
> -      variable.
> +      variable. For additional kernel image types, use the
> +      :term:`KERNEL_IMAGETYPES` variable.
> +

I would simplify by just saying to use KERNEL_IMAGETYPES or 
KERNEL_ALT_IMAGETYPE (or maybe even replace KERNEL_ALT_IMAGETYPE by 
KERNEL_IMAGETYPES entirely).

> +   :term:`KERNEL_IMAGETYPES`
> +      Lists additional types of kernel images to build for a device in addition
> +      to image type specified in :term:`KERNEL_IMAGETYPE`. Usually set by the
> +      machine configuration files.
>   

Technically, the KERNEL_IMAGETYPES variable will end up containing 
KERNEL_IMAGETYPE and KERNEL_ALT_IMAGETYPE but that's an implementation 
detail.

If you could address the second comment that would be great, the other 
two are just remarks.

Thanks!
Quentin

