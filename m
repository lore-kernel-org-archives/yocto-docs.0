Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E40AC07E9D
	for <webhook@archiver.kernel.org>; Mon, 26 Sep 2022 13:40:18 +0000 (UTC)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (EUR01-DB5-obe.outbound.protection.outlook.com [40.107.15.48])
 by mx.groups.io with SMTP id smtpd.web11.28598.1664199615375604276
 for <docs@lists.yoctoproject.org>;
 Mon, 26 Sep 2022 06:40:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@theobroma-systems.com header.s=selector1
 header.b=UcZKrlIk;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.15.48,
 mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l4T5jjqAA+ZhCXaLF/dOPz4d1DKVS/CNfGMt2i5I5BPLxGateKXYHPj1HiOcposmT4fC1M74JwgenT0/Yg3yqutpMZaH3ceriwyaUAB7QUSwmSfqDVoeMuGHo1pJk1hm6Rc87/4wj8zXP+z09BGVWuvr1MRM4gzXO4dY+LVY127cmCyN7HCt9W/l4xbkB+79OZUnoJxMTeHYTUQST1kqcOlVIwvvOpF2VinZ178FEktNcPWOKQi0755vHVIueMIseOTNNv61158xSM4dQSIUJgtqSDMo+3xBPVujkviWOWqS5STHoJ+vTLe3dqI7RKbexq6GorkrjDjHrGH11g76eQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jVOyOAcz04CacWyvf9OKPBE2iqvGDSlEuj8YTbDnDQY=;
 b=MhRwVR9Npp6KXzJ1ODwq5wQezHzTKiTBbALEbrXZhao41F7RCDn2ABw2R2KQmt9syGr76YccKApUirI1H7PqD3ZntI0eReRWgZTDDmF3epCLiUXTP4dZdfxeaWAxQWAKBXDy8KAew2YKgmiad1/PVwZdQknCOyWVFsftHeT4BHRVf0Prr1ICDcj5kuj4D1GcltL+7aOJ0UJlOPYVnyr8hp3mJyB867ABvJLe4UQdA/RAAhtlPt7lLiNGbnjnk1GCvgXSn/HTr7oa6cv4b8VOH1pBfwvb7FQc5N4x01G19m36R9E5VZSIWGgbB6NUS0psCod2TqlnoeEjr8cN38WwnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=theobroma-systems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jVOyOAcz04CacWyvf9OKPBE2iqvGDSlEuj8YTbDnDQY=;
 b=UcZKrlIkSJ2HWN5gXP2fbBdH9Exm2byjBKFJ8BP6tJKElZ41e2HN1sJcgtCwE/SAkWzzXcIOaT9+S66t3qUXqrcnpPHS1xM+oqFKdZQcLyvVhcSTPye9wRNoenE6YRbmNVbz01+kn2LyVsXQGXF4yt0k2IrdOa4s8R4yMBzdyXLnwmuIsVsPN0ywusOAkHc+4ZcGMP1Ao3VA48HdfgS22ntqNj8IaCVIBk1iYU6SZddPjXDyi91l2U/plhmrcKECWGnnF4KE8Dze4wdHeZ3+AmqrZxbOLK3Mekfx3C4yoCemNyS+rHMu6C1Jnd8Hq6KwcZc3xQJyuLSs/alb9fP+PQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com (2603:10a6:10:2d7::10)
 by PAXPR04MB9470.eurprd04.prod.outlook.com (2603:10a6:102:2b3::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.24; Mon, 26 Sep
 2022 13:40:11 +0000
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::5e5e:1989:e5ec:c833]) by DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::5e5e:1989:e5ec:c833%3]) with mapi id 15.20.5654.025; Mon, 26 Sep 2022
 13:40:11 +0000
Message-ID: <1b02c2c8-9d83-fc71-2ed6-d099de28884b@theobroma-systems.com>
Date: Mon, 26 Sep 2022 15:40:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [docs] [PATCH 06/30] manuals: add references to the "do_deploy"
 task
Content-Language: en-US
To: michael.opdenacker@bootlin.com, docs@lists.yoctoproject.org
References: <20220923175219.6652-1-michael.opdenacker@bootlin.com>
 <20220923175219.6652-7-michael.opdenacker@bootlin.com>
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <20220923175219.6652-7-michael.opdenacker@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0121.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:94::8) To DU2PR04MB8536.eurprd04.prod.outlook.com
 (2603:10a6:10:2d7::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8536:EE_|PAXPR04MB9470:EE_
X-MS-Office365-Filtering-Correlation-Id: 63865176-8f33-465f-9ff8-08da9fc4a285
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ZfXaPc+IhS1xfDk/DHTdY787tFpaA0wJIrFAAtqih3zeSBXF5GWOVHYs48A1+uze/nMvm6VCy9lyonDxeKuXJ4yAiOussPQmNI7oQJ+VfvoKBMC0BG4BuyshCYd4NoMPXQNgOwcADT3tZRGVrYhogNn6up6Mx6Xbw+VWTOY4ExRZKXlFR/T4jJgBV/1UKUK3hJehk6pKu5pR7GegnK060bXdCue/KDGsKzhWnaPoFgZ0tqyU4kRzkUxi8k7AJdgqRSueGld+SBRQUVmbKEXqjJnasvViaIcWLrmw82Cp9lZaXonGPTnOPsqvtD+yMz7QeuVVKlMiXGg4XgIBxvpUfd56LPcbsPo2nEMRuYL5eSkUiODobZn8WyvlsGXxGg9qXmIYo0MhDTOaUG3WQ7dKa6a3woB3H2uErwakCWC96TmQkEP+mriFLHpW9FjqOdojZc/Wa92xYk9NXywOPFzsU0NcxAr7kO/h8NUq16VgiEA7hhQtrK207c6Bu6lrgU7G6RxnSXKes/D3Ut3CEwMYyg9Bypg9a1S4fkK2QEg/p+3HJwbRRUCCLlOGJ6PSapGcSotOFq7N9MRgjp9NJMaJkfTaqLprIoudVKkTG3/EMWKtE6RfOnGo8HsguCD7klURqhT4HfVAVYBxpkNmlci0ipSFIjymFZTTgicvv9v5cD9twVd62vTzvLsrcdb4JIm5S6shQ0UdKyioUk/6mBw+yaXjm9jkPBp1WLEVHQ5WrCqQJe2s+7cKkWN8wNMQn/bA/8I0mULka0Vg7zNzqqMw+QhRd7fX4RxC/hxh1mAEm7Q=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8536.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(39850400004)(376002)(396003)(136003)(346002)(451199015)(316002)(8676002)(38100700002)(66476007)(66556008)(186003)(66946007)(478600001)(6486002)(26005)(2616005)(6512007)(6506007)(36756003)(53546011)(83380400001)(31696002)(5660300002)(31686004)(44832011)(86362001)(2906002)(41300700001)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ZzZ0eGVpQzZNWWRVeTkwUFlNT1pzNE4xam9DR3Q1N0xiNzZkeTMxUlBzUlc0?=
 =?utf-8?B?SFovV3kwTmI5cjJDb0JGdCtRQWY2dG02dWtLT25hL2tWTmFMU25Da0d0UHVT?=
 =?utf-8?B?amxiWjBaKzArWDFLVHRacDRYVElDZ1RkOFFNUmpxa2ZMV3ltNEZrTExRRU5K?=
 =?utf-8?B?Tk9JUzRIcFQvRU53blVIWWE0NmVZaDRxWGY5Vm1lRXlxaTh4bVhGK3hBdEQx?=
 =?utf-8?B?Q3BXRWxxQXRhTXo1NVd0eitlTVNUZnZKSjFKaDhMTDhyWkxKRzg5RFZPZFY4?=
 =?utf-8?B?d21RMnhqcWljQlVrVjkweHdvYnh2REZIN1BjbEF5TG0vRzJlUXBoUWhMbnFr?=
 =?utf-8?B?TVV4NWhieWU5S3oyOVUwMmlSZHdSNjhiWnEvQUNURmUzSWZ2aFE1em9QQVk3?=
 =?utf-8?B?djJhT0JZaGVYVVl6MzZ3dlhTeGFmTUw1WUpjckoxQmk0MWNyaW5JMlBTd29X?=
 =?utf-8?B?S2FtVmMzRHhUcXovbFZ6QlI3bUFkWnZBdlFqRmE0TTE0ZlFiTG1vclpzVGJI?=
 =?utf-8?B?MmdUazd0YTFFM00vV25XaFV6YkIyUlRRbWtMVHpyU0p0TTlHYlI4ZWdITVFU?=
 =?utf-8?B?TVBBeGJIZmVzYXZ6ODNvc3JTeU4vbm9aeEZ3c1lxM01PSG9McEp0S2VWV3Jp?=
 =?utf-8?B?dG5aNEorSEhJRnFhT0tIOGhPTW5kMGhXNkVJNDRNdDQ4QXFZS3dUWk96ZGFq?=
 =?utf-8?B?bmdhNkhGMUNDeDFueTgyeGVPQVhJSGVvb1lFa1JlaXBIbm5IVnZpc1gxUFZ3?=
 =?utf-8?B?QmZrbW1OS3dZaklGMTJ6MnlhblNCQXFldm9xQjUvY2lTQVBJZ1VDYVlVU0hl?=
 =?utf-8?B?VnRialpHTmNPNGpYTk0xUmRkYWZ1eGdNNTl1cjJLRHZCdElKaGNFclZlZktv?=
 =?utf-8?B?c0EzaFdFQ243bFhaTG5hVUNEbkN1amFoY3pjNkJybUJCSy9nUXpKTWU0a2M2?=
 =?utf-8?B?MTJsS0MyK08ySHloOHNVUFNkdkZkWm80TkorZmJ0WnhWV080NHlVWTNHQzVp?=
 =?utf-8?B?OTBPZG5SMkZEbE1lcXJzUmVpaEg0UFNnclJFS0JUUTEvTERhZzZRYmJzTEMw?=
 =?utf-8?B?ekFyWE9CN0ROKzhYWnhYa1crcHZzWndHZThFdjNpYlpPZlYyemVTNkVWalp3?=
 =?utf-8?B?SFIxeWxhK0l2YjhzL2NRa1BMRGdYWURHM2JTQ2FhVGRNNzhRazFtRmJyY1M4?=
 =?utf-8?B?eFZmZWtDRnhqV1EybFJxd3lhN2FpTE52KzEwd2Eva1hkOGl2YVlSUk9Da2pl?=
 =?utf-8?B?eXJoNW9ualQ1eU1HNkdRNnhvdmoxdkIwVEw2UGwrMmxJV3c2Y1JaamVNWCtx?=
 =?utf-8?B?Sk5sWGJ3c0lDakgzcVBDaFhaQUQ4WmhSN1liOUp5TXlvNjd6TGErdVpPUmdJ?=
 =?utf-8?B?Vkx2aklyMCtTMVRkbXVUNmRsY09qZ2R3ZGkwY2JuWnZXRGFMdWQ4R1VBbGgy?=
 =?utf-8?B?bW5USHlEWE5DOS9lN0FjRmIrNVM2djkwQ1J2S2FSTUFGRy9valVTRk4xR1hr?=
 =?utf-8?B?RTZPb1BMYk1NQnkvYys2TERXMUxKbFZFNjBuL3NBUTk5LzFZZEw1cmJpUXl6?=
 =?utf-8?B?dUZTUzFRTjlLZVVNNEhIZjFtV0VDNFZXRWI4dmUrcUk4M1dCMVZkWHFJWEl6?=
 =?utf-8?B?WFhOUUt2ZEFQRXVSdjdKSVlZUDNHYTZqMFZxTk5uc2QxNnZ0UDc2QThFWHVj?=
 =?utf-8?B?KzRDakhReDVEcnlTdG56SlBmZ2t4dFJtbzNtSnl5U1I1NE9HaXduOWV5VHpx?=
 =?utf-8?B?Wlo2RVJ1allBN0psMUl0S0pqZi8rNitzam9SVkNUU0RsS1dRd3dwRnZLZ0hC?=
 =?utf-8?B?Q3ZEN1ZLQWl6VEYxdE5uMnVKaUhTMVd1SFZSZSt1d0xoREIrMnNDdnVnb1Rn?=
 =?utf-8?B?QTJjRWxuQWdMWVQzbWVwY0RpSGx6UHE4dThqYVhKTnhObTlCWUJFVVc4YXJL?=
 =?utf-8?B?KzN5b1JkcWF6b1RnYjNpQ0hOTHZZVWpqam5EZmVBYlY4aTgzWld5YTczU2JJ?=
 =?utf-8?B?cFVTYlMwdW1GT0JacjF1ekIzU3BDOTh0L2VGMm1ncVdsYjR1NEZVTjAvenZV?=
 =?utf-8?B?TnFXUjllaFROZVhjTGd6VE9vbmV5VmUxSWJNb2dJYzVwS3pyWmxLalVDb1ZF?=
 =?utf-8?B?cVFZYlVwaXJQSi9hNmQ1OFY5c2xTdmFKbGJ6MEJkVVJuWS9SK1NXckdweVZw?=
 =?utf-8?Q?gMcYgbW2Xq+mh/hIuQDNiu4=3D?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 63865176-8f33-465f-9ff8-08da9fc4a285
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8536.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2022 13:40:11.7449
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 HW3HVX+7yOw1om/e7mf4Wwg6aY9G/57fLn542aay/f62eOYXxMvZg0Yj2WWdWlL4DmRlK1OMkHHXGKMnnhHBGvmHsfFjQZUmyXXdbWko2yLB75g45r0rU2JeczKebvWx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9470
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 26 Sep 2022 13:40:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3246

Hi Michael,

On 9/23/22 19:51, Michael Opdenacker via lists.yoctoproject.org wrote:
> From: Michael Opdenacker <michael.opdenacker@bootlin.com>
> 
> [YOCTO #14508]
> Reported-by: Quentin Schulz <foss@0leil.net>
> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
> ---
>   .../migration-guides/migration-3.2.rst         |  4 ++--
>   documentation/overview-manual/concepts.rst     | 18 +++++++++---------
>   documentation/ref-manual/tasks.rst             |  8 ++++----
>   documentation/ref-manual/variables.rst         |  2 +-
>   4 files changed, 16 insertions(+), 16 deletions(-)
> 
> diff --git a/documentation/migration-guides/migration-3.2.rst b/documentation/migration-guides/migration-3.2.rst
> index 8a8d19d605..4c0de7b0f6 100644
> --- a/documentation/migration-guides/migration-3.2.rst
> +++ b/documentation/migration-guides/migration-3.2.rst
> @@ -207,9 +207,9 @@ files into a subdirectory and reference that instead.
>   deploy class now cleans ``DEPLOYDIR`` before ``do_deploy``
>   ----------------------------------------------------------
>   
> -``do_deploy`` as implemented in the :ref:`deploy <ref-classes-deploy>` class now cleans up ${:term:`DEPLOYDIR`} before running, just as :ref:`ref-tasks-install` cleans up ${:term:`D`} before running. This reduces the risk of :term:`DEPLOYDIR` being accidentally contaminated by files from previous runs, possibly even with different config, in case of incremental builds.
> +:ref:`ref-tasks-deploy` as implemented in the :ref:`deploy <ref-classes-deploy>` class now cleans up ${:term:`DEPLOYDIR`} before running, just as :ref:`ref-tasks-install` cleans up ${:term:`D`} before running. This reduces the risk of :term:`DEPLOYDIR` being accidentally contaminated by files from previous runs, possibly even with different config, in case of incremental builds.
>   
> -Most recipes and classes that inherit the :ref:`deploy <ref-classes-deploy>` class or interact with ``do_deploy`` are unlikely to be affected by this unless they add ``prefuncs`` to ``do_deploy`` *which also* put files into ``${DEPLOYDIR}`` --- these should be refactored to use ``do_deploy_prepend`` instead.
> +Most recipes and classes that inherit the :ref:`deploy <ref-classes-deploy>` class or interact with :ref:`ref-tasks-deploy` are unlikely to be affected by this unless they add ``prefuncs`` to :ref:`ref-tasks-deploy` *which also* put files into ``${DEPLOYDIR}`` --- these should be refactored to use ``do_deploy_prepend`` instead.
>   
>   
>   .. _migration-3.2-nativesdk-sdk-provides-dummy:
> diff --git a/documentation/overview-manual/concepts.rst b/documentation/overview-manual/concepts.rst
> index 06220401bc..f3f8cbd95c 100644
> --- a/documentation/overview-manual/concepts.rst
> +++ b/documentation/overview-manual/concepts.rst
> @@ -1801,14 +1801,14 @@ from the :ref:`deploy <ref-classes-deploy>` class::
>   
>   The following list explains the previous example:
>   
> --  Adding "do_deploy" to ``SSTATETASKS`` adds some required
> +-  Adding ``do_deploy`` to ``SSTATETASKS`` adds some required

You missed one here.

Cheers,
Quentin

