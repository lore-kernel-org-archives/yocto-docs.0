Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDA93C61DA4
	for <webhook@archiver.kernel.org>; Thu, 16 Feb 2023 09:32:48 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.43])
 by mx.groups.io with SMTP id smtpd.web10.6353.1676539959979548384
 for <docs@lists.yoctoproject.org>;
 Thu, 16 Feb 2023 01:32:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@theobroma-systems.com header.s=selector1 header.b=Y9/mB63S;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.22.43, mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FMSEisBmLf+/ogK45TtwXvjVxDzfrtM1cRkLsn/Qt19lOCecllTWuaXEIiXdNVQrn2+kjfsRhra5mJfhDGS5wBdukW45PKzec9QZwGNNkset3paN0+I3CIwMjJ/TDsGlRti6heGUnnTUiNQeMV3CqWX7ympwTkj5Z+SbvEWCgUhrfWHNiL3lcxsWX5G5A1RL00x7U3OtnpnOXnkwG0/5iHsivJ7fXxqu3s5SV5nbeYhTYhfAxk+/IpN4OqC6buwVqRd2h+/pwx5UXSZ3ZQ4a1De3EvVPDXJ3Iu2STDjEROILXOZTUMsyVVH1SZq86c2ZY8MKX0X6pmhS63GvucaDow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JnAVHG09MzFK4chQjFd+TJpIWxH+3NbQo2Xw2a0Crig=;
 b=Annu2/VH7ScAamkw5d7CExALREZVjkQIFzYIF77wF0WgmYNtRm0Ui6fLlMH/gwxCfVucjXiTujV3Rv4n67XqAnhO3AWQbnQkyTDv3DGu71zuRaiMdMnHTUuQYlrlSpbFm5ZnSoZAKHr8F5xm7zAT7hn2tUBa2xa/TGplejU/mqk3vOvMOFb4gfb5THb47rp+M5wQPuBOUKWfrb8G/Ec4ofgR2bXtomUhyI3RHfr+2WCORmex5dnMIuZKszjvafSGyk+W7fF1EdyT7hhqh5ozLSH0G1+JKjgBqYLE0e5d/S5iJeRCFKo9iJD1AvcQFjjo9Osp3MK8cJsdTZmKr8S6OQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=theobroma-systems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JnAVHG09MzFK4chQjFd+TJpIWxH+3NbQo2Xw2a0Crig=;
 b=Y9/mB63Sg4netXosveTK9EIBodxPueLOzPAz7eBcckThwrG7VEArUbTrxIaHJzAYyK2XTlIuYzxpNyS1TyrvKQ5SBjOFOdXVan4vFVH55qhh8HjGqGOnJ2hZefCj9YjAo7OVtZygA7urbGavDiqAaR8QNkWh+Qk393GCxHmc8DbdsLG8FvtBhM7dL5g8av9Lu5DOBP/qV49jAKtkSX2CHSljWAbydRAoOVSd7P/6aGFGC5QT1riYCNhjJTnmj+EoW4zxwLoxjoX5u8+BTOBDIvY2z4d63Gj1BGOySeLSs8DSQgG2PqwRUUOPbAF2VaAiQ1hywPLOgBT//LmXtasR0Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com (2603:10a6:10:2d7::10)
 by PAXPR04MB8925.eurprd04.prod.outlook.com (2603:10a6:102:20c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.26; Thu, 16 Feb
 2023 09:32:36 +0000
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::24d3:14a5:eeda:6cdd]) by DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::24d3:14a5:eeda:6cdd%7]) with mapi id 15.20.6111.012; Thu, 16 Feb 2023
 09:32:36 +0000
Message-ID: <20d3b32d-e5b1-f39b-81da-47ce782726aa@theobroma-systems.com>
Date: Thu, 16 Feb 2023 10:32:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [docs] [PATCH] ref-manual: classes.rst: improvements to cmake
 class documentation
Content-Language: en-US
To: michael.opdenacker@bootlin.com, docs@lists.yoctoproject.org
References: <20230215105907.114700-1-michael.opdenacker@bootlin.com>
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <20230215105907.114700-1-michael.opdenacker@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0101.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9c::7) To DU2PR04MB8536.eurprd04.prod.outlook.com
 (2603:10a6:10:2d7::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8536:EE_|PAXPR04MB8925:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f503f19-9d73-4a8f-cac2-08db1000bd18
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	113/07iRmkrbHM0BHKMrAXoaKIly5PzI5WWKiarbum/jBYBFo7CpnDe+UWrFeEL6+ik4eaaS7CWh10JJlRhijcuxIayToaCs5FkAxeksETWOAHAhrDt5eWIbs/GQUtDGLK8+JGG3S3owumsjuEKfZaD7UUKr91Xl2wrUdEo0BhbabVg4TJYA7PkIn7fII4MmR2hL0NwT+OZtI+M7AV3pa1+HrLaBYPShAiqxB5uX0wBZ8nRcw+x3OF1irgOYnOPAVLXc462nH2CCMF5vQRCB6Smi0uGizIKf7YFMHbdV1xp/3FJ1gjYl5Bu92ZJzdOoEe17nrh97nEmp+41YLaunSb6jcjcHI1jn0fA8FUJ+rDi15WRBh/ELQSZ9g7ZdmRTDnaxFgcNxyx6Tu0kWkMewRNQTCv7O8dPv6cwFw4r7VWtfIFTAfns0dz3tzPg4MKXJvqU4QXai/JrFiXSoh449fe2FTsTPKzrIswBTWvHnP2hsezHkWKMPxq/Kdm8g/4wp2f82NZC/SUBLvbBPHjAnTTdfZcx6lrwz7fsf56RF4E/7ythWJWvVVeHTlIwRG6OzJMYgeJhj6vFqlmY4S29e9yCcegq3F0Y8jiRZBY/IoipzXWjdhYfMxhBEvGcvTC+HryJpUbkpbHW8jhQ3Bm1b+bEdvDtuIg1v4uqn1May9W4pPURQhvTW1AG9xCdRt3P1V3Ej1t7OFSNygwdhtweNwv1Sn45tE9pvv/I8d+NWtMQ=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8536.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(366004)(136003)(396003)(39850400004)(376002)(346002)(451199018)(8936002)(5660300002)(2906002)(36756003)(44832011)(41300700001)(316002)(8676002)(66946007)(66476007)(66556008)(38100700002)(26005)(2616005)(31696002)(83380400001)(6486002)(6506007)(53546011)(6512007)(86362001)(186003)(478600001)(66899018)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?bVYwNXhoTnNqajJWWVJ1Mm95bnV1S2pWMCtESkpXc1NUTG85TzRINzZxSThD?=
 =?utf-8?B?RWlQRlphRXJ4TzhwMjBKSU9udGpMSHA3dC9WcVpnQ09ud2M4ckMwZmtTSkhJ?=
 =?utf-8?B?YkJTL2Noai9pNkpmdVJjK0JOdVVPeHBSN1A5dkZWNExoSUp1TzBxV2pxd1hI?=
 =?utf-8?B?YlhMTWhRc1JNT0swdlhEcjRoUWtNb2gwdjI3ajA0ZlhPK2svZityYlNZMU9Y?=
 =?utf-8?B?YWlqbjl5YVlUR2UyWDArT1hFRm5uOGtRVW9WaVhsVllPU0t0cjEyamsyeFMv?=
 =?utf-8?B?WThENjlEQkR4bnRZWGEyNTEybUxYM0hjNkF1dWhYSUV5MzBpRkpiSmN0NTJn?=
 =?utf-8?B?bWloSitWTHJDNmdEbVpDT3dHMGk5akdQT2QzTGhiQXhxd3FoNElWUUQxWDBz?=
 =?utf-8?B?SmFXeFM5WEIxUE9pQktNdCtUaUJaclJ5RkRZNzl0Z3p4cTRLb1lPK3d0SHZL?=
 =?utf-8?B?RDZSZXp4Q0NZWmxyOGtmZmJseVAwOVkzVXltS0lLMU50MUlQTzhDUW9OdmNN?=
 =?utf-8?B?Z21PTmRRb3lpOE9OY3RlMWxDWnJyMGpaa280QU40TnQwNWd2ZE9MVmgyRmlu?=
 =?utf-8?B?aHA0aHZtK1NjUE9ob2RmTkN4SVJrZkQ2djJJS1VZNW5oK3NGN0V2Tzd0aDNS?=
 =?utf-8?B?VWswUGQzdFVNUHhpWXBUbXZ4OVRzSkhDWGNlTHkvWElkSzZFV2JpV2o2UVl2?=
 =?utf-8?B?ZjU1ZTI2OWlqNTNlUmJ3ZkVZWG94N0x0WG0zN3JyWXNESjVoYVQ2QkpVQXBy?=
 =?utf-8?B?UVJTRlRzY1A0UndQOWx0NnlvZnRXdzZxN1QvUFBaUHcyRDg3WjFhaStieTBC?=
 =?utf-8?B?Qk9VQjQ4QnZLNXFqdW4zVzhDV3RpdWh6aUVFcnhyTUlDWHZacFErRWZNb0RY?=
 =?utf-8?B?QTFITlFHUE9YUXBSWkF6OHBTK25uR3NDT3hIWTJkVURDbVFxbUpqUmF1YlV0?=
 =?utf-8?B?aklnVHVhWHAzeHN1MkhmN09YUDRoV1ZYdERDV09KSVpwSlhhYzJ3NUpHK3Bs?=
 =?utf-8?B?WktXRlM3WEdRazNoQkhLVU5ZNDAvUXZLaFcyVkFhNFhkekxVcklPYkdrZ0tN?=
 =?utf-8?B?NzFDVHJiSUlvMDlrcVNPajEvdW9xSnVEaGgxMEJNQzA1bmZ0VmxLNWVjRThm?=
 =?utf-8?B?b20wOE5YZlYyNWpkS1ZTYzF5VmpZUnV2NDU2K2VUZVFrWkEwSSs0RGVkVloy?=
 =?utf-8?B?UWZLL1FKVTZXbXNQSHQ5Zy93L2llYTVTekV4cU9EOGR4WUN6V01UVWlENWp1?=
 =?utf-8?B?T0NYZTN6dU9pQ2dmcU55eGtUTXFSM05QaGthdjBNa0JuZzdSeWsyZGFmTVZp?=
 =?utf-8?B?ck9ybHd2MG1tS3UzNFB6YXF5eVljUUtvZ2M2c2x3M01lYUxuM1RSSktYV2Y1?=
 =?utf-8?B?bEt2TzZoeFpzc1ljYjRHSm9YaWFaeklyNW9CK1BibEF6djFIZWlDTHlUNG80?=
 =?utf-8?B?NEFsZEt0WDg4SGN1OHNNMGxNVXpxT2FNZ1FsdEdYVGVLZUVkMm1nZCsvaUtO?=
 =?utf-8?B?OEpxL0pkUlZqZzAvKzF1b2FFS0VqU0xCd1lZY2ZVTVlPK2NxVURNT0U1Zkxw?=
 =?utf-8?B?SUFaYndob2lYTnMyZTV0OUErNU54WnRmTHo1ZnB4d20rekVXRmVhTWVCd0Na?=
 =?utf-8?B?ZFlaNW5QaWtpRnAyazlsRzdtTGtJY0Y3OFBsMGdzL0hhSkRncFhMaVpyM0Jk?=
 =?utf-8?B?Z3VMdzQvVmsvNW9ueWVMc1BxVC9NRm1UZUpXVnI3WUh4WHIwNERTbHgzdyth?=
 =?utf-8?B?T0UyUU9taHkxdnRleWNRY2ZQN1Uvcm5SR25tTHVRdG43RzVZVUhuZm9KV09o?=
 =?utf-8?B?U050RkYrMHQ5aThkNTlzQXY5aDcvZi9YY1d6dVdHYUtlT3QrL0U5VUxmVHRC?=
 =?utf-8?B?b09PdVQ5MkQ4WkZBWFZsdlNjeDkra2cvbXhhb3NyZDQ0SU44NWZ6WHFRVG1S?=
 =?utf-8?B?QjJOOVVEdHhwRFpFMzZ4dXhuSEMyS282K0xWMzBGNTd1M3Z1ZE5TcnVaM1h5?=
 =?utf-8?B?dUQ3STArQlpIajRwNTNENVJmNXUxQUNEdE04NXIrMUxYYUptQlh4YUpmTzdm?=
 =?utf-8?B?UDBYUFQrMFJ3U2R0dk1CaEJvQzN5bm9UcmY4MGNFN3ZPenJIZmxDUzdSL3k0?=
 =?utf-8?B?MXVLNmVXZWEzaDhydHNyVUdaeEVHWEZIdFJIeHBSYnpBb1RmUk1vRXF5dlZQ?=
 =?utf-8?Q?A3ll+DdoC0s8x1vycHJ+1k4=3D?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f503f19-9d73-4a8f-cac2-08db1000bd18
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8536.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2023 09:32:36.2882
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XFkr4NnKDH2H2gHp1ByuDvaYwCVIXGS9LD8jDEiC3RgsUnB8Ox4/MEnLv69HXHA6ZdKMNAzsK+VMmLv4ISdjImc8IqAk+qKebm/QWXMGwM98xj1KDgqYcj+Z/Iy4B1vH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8925
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 16 Feb 2023 09:32:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3691

Hi Michael,

On 2/15/23 11:59, Michael Opdenacker via lists.yoctoproject.org wrote:
> From: Michael Opdenacker <michael.opdenacker@bootlin.com>
> 
> - Fix quoting for path to cmake modules
> - Document OECMAKE_GENERATOR variable
> - Style simplifications
> 
> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
> ---
>   documentation/ref-manual/classes.rst   | 25 ++++++++++++++-----------
>   documentation/ref-manual/variables.rst | 10 ++++++++++
>   2 files changed, 24 insertions(+), 11 deletions(-)
> 
> diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
> index b5443c0d0a..3beccb4855 100644
> --- a/documentation/ref-manual/classes.rst
> +++ b/documentation/ref-manual/classes.rst
> @@ -346,17 +346,20 @@ in order to make them relocatable.
>   ``cmake``
>   =========
>   
> -The ref:`ref-classes-cmake` class allows for recipes that need to build software using
> -the `CMake <https://urldefense.com/v3/__https://cmake.org/overview/__;!!OOPJP91ZZw!iNA2vN8toaxYO2TbPOrNnBcNXS6SmFZYJDid21JEAzDilDFda1et7uKBF9xjIdOmh6u-9K0NW4WLqOXZPtlcj7xyFOiYeZ0ClIsmkLl9Ecg3LmpEaTDt$ >`__ build system. You can use
> -the :term:`EXTRA_OECMAKE` variable to specify
> -additional configuration options to be passed using the ``cmake``
> -command line.
> -
> -On the occasion that you would be installing custom CMake toolchain
> -files supplied by the application being built, you should install them
> -to the preferred CMake Module directory: ``${D}${datadir}/cmake/``
> -Modules during
> -:ref:`ref-tasks-install`.
> +The :ref:`ref-classes-cmake` class allows recipes to build software using the
> +`CMake <https://urldefense.com/v3/__https://cmake.org/overview/__;!!OOPJP91ZZw!iNA2vN8toaxYO2TbPOrNnBcNXS6SmFZYJDid21JEAzDilDFda1et7uKBF9xjIdOmh6u-9K0NW4WLqOXZPtlcj7xyFOiYeZ0ClIsmkLl9Ecg3LmpEaTDt$ >`__ build system. You can use the
> +:term:`EXTRA_OECMAKE` variable to specify additional configuration options to
> +pass to the ``cmake`` command line.
> +
> +By default, the :ref:`ref-classes-cmake` class uses
> +`Ninja <https://urldefense.com/v3/__https://ninja-build.org/__;!!OOPJP91ZZw!iNA2vN8toaxYO2TbPOrNnBcNXS6SmFZYJDid21JEAzDilDFda1et7uKBF9xjIdOmh6u-9K0NW4WLqOXZPtlcj7xyFOiYeZ0ClIsmkLl9Ecg3LqOSrdIo$ >`__ instead of GNU make for building, which
> +offers better build performance. If a recipe is broken with Ninja, then the
> +recipe can set the :term:`OECMAKE_GENERATOR` variable to ``Unix Makefiles`` to
> +use GNU make instead.
> +
> +If you need to instal custom CMake toolchain files supplied by the application

s/instal/install/

Rest is fine, so
Reviewed-by: Quentin Schulz <foss+yocto@0leil.net>

Thanks,
Quentin

