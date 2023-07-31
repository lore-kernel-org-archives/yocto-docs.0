Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 058BAC001DF
	for <webhook@archiver.kernel.org>; Mon, 31 Jul 2023 09:11:26 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.75])
 by mx.groups.io with SMTP id smtpd.web10.3454.1690794682550906003
 for <docs@lists.yoctoproject.org>;
 Mon, 31 Jul 2023 02:11:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@theobroma-systems.com header.s=selector1 header.b=EHHNRvtf;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.7.75, mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jsqh57RfBwKFBrmtsdlx4IWBmLvT3injUNxgXicMJL+VOMcODwBC/O+sCZHxBwZpuVKzJn5ZYbTRyF5m+jSEBF0KqU2n56wDltbIK98ECdukDHibk3mmIZBQ4Ygl0bX15N1HMJfNG6ZyJxKWW0sXFXN8T/+Iq863H/MXBP4AChn1C84eQ+Qg/N+/JAQyKK09sP3GyHTM8JGrOMWRdAoJ8A076oZlJ0Tu6NjTETfgZ6AdY+XL+YmtukRtnXvQWjxNztzTMvE26beSSyIO/bLvW9S/8g8E0xI2DeMLz/eo23y5SmoSPJ0czBHWc29Ur03JnlyO2/KnarDeWDBm9tgK6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1VhCRHzpXgbp2SQF/MIRRVGhCzRSucVgH2IEjsKQ2WA=;
 b=LYT407KWtGOV/I9XplXR6cvF2oL68x6AT/UjyVLZARDG09j8YmhZxmZiQiDN7SLDH6ediLwA6aZzSGl2Ouf693mT4fiRpnNZgzxDzsB2yxIIdBt9d6FOTyEHKzQuWEK+FSx2edzfJVcrNFIhLmXKsdsUvVg9EPFQtSYi1KfFOfYfd8ALUVqSqddZMg94BFYfAijMhM/VxrWyFU2/hrQzMzsIbHqfBbjqnKYn8FJDbWJfBcsRP92Dhe1wnyWruRc37MMnyN7WvaAoWtzB5his1J0DoRLQAln3v6SxdGCs6RJJprhLFpR8NyR+lthUakeljUTgL+SGSFjfYJj8gTnusg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=theobroma-systems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1VhCRHzpXgbp2SQF/MIRRVGhCzRSucVgH2IEjsKQ2WA=;
 b=EHHNRvtfS7XxRXYWnMi1wYqlY+1gARqw1h28RxquIXZY7tVUov8uAnRAQDsTxRoBIGBJrAorJHcLHD8wbAQSAxBABIpPCTh7zrjTtQHpuW1OtsqiTjHREtkNVKCaEv/FpPZKdFB9R/KGuQvgeQ3G11xLvHxmB2SFYrV70PqsuZ/l+VEJXFibl9Sz3FbdYnNMH8574XUZLvPNn/uZVEJgYfgg0W5SDhOpTedZRDR331F/xuO/Z0Tx3RtEyaRwn6k6qr/GwK4KWHtrv97AUFmXT7Y2BVbaoC75EhKXFsMWDiRDAE8P9lzdNJ8zjRGsCe0FHnw0UkTh4GR9QfuFBr9RbA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com (2603:10a6:10:2d7::10)
 by VI1PR04MB7040.eurprd04.prod.outlook.com (2603:10a6:800:121::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.42; Mon, 31 Jul
 2023 09:11:16 +0000
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::dcf6:ae13:fdf2:13e1]) by DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::dcf6:ae13:fdf2:13e1%3]) with mapi id 15.20.6631.043; Mon, 31 Jul 2023
 09:11:16 +0000
Message-ID: <ae535037-9245-66aa-c71a-cb4e6fe70454@theobroma-systems.com>
Date: Mon, 31 Jul 2023 11:11:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [docs] [PATCH] ref-manual: document image-specific variant of
 INCOMPATIBLE_LICENSE
Content-Language: en-US
To: alex.kanavin@gmail.com, docs@lists.yoctoproject.org
Cc: Alexander Kanavin <alex@linutronix.de>
References: <20230728165026.862640-1-alex@linutronix.de>
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <20230728165026.862640-1-alex@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0127.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9e::15) To DU2PR04MB8536.eurprd04.prod.outlook.com
 (2603:10a6:10:2d7::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8536:EE_|VI1PR04MB7040:EE_
X-MS-Office365-Filtering-Correlation-Id: 00ad90d0-d014-410b-b794-08db91a61897
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	BDHm1LsyS0L9xLaXqFe6iSIo0pNGqPh+PzcFYlEb5lrsmM6U8swyVfVogT1OwgWlB8cMlvos4iK3zXzrzfOjioKUjyPFnyZdPOwEYOyuxDi8ywQVuD76xh2oKGlgul4HoOSLiDVUtBYKNJTlHT/7cT8Ih8hYRMP/JbncJ8HqXk0/y678kw2vgiMN1p4WeaYAJvAyuP4J0sTd1IB+xuMe4YG+ADUyXq66G5pwr6m9FAE64VfeX9yHVn6qt16G66YtEekqhgRpZoXQDI33/cVsx5hs3hdbTGV85L32RF0MUpqH8zrTn2LTUAA5KsF7FD8XurW0nQx4EzD0qYkZEQgZ/3ID+3dJlYbGRU7DWabCblp5XShFOCEQ1X4612ZOK8fX5+YGph/o9EHcm0fwWYQW977dsB8ChYwxwSKrNVdzETCiHaahokZEjdeqmUrzwgK15fJOhu4Hsn5PnVW02aNqCMqrHOh9rUs2/e3VaJrvV5tqCYE6YrzywrI2v4GP4Q/70hAQf/VZHlwllpKD4ASm0rp+EA6+YJdXBLfsLAg1rqSVB0BsHGIbMU+QBtUryqwh0+3I0P7yZBH1cXuDXTi/Dm2qLV+9CxCuEi9oN9zjVsfItWWdp2uSpykueTsTnvu9TaL+GiQor8z+01e6Zj/4eg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8536.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(39840400004)(376002)(366004)(346002)(396003)(451199021)(38100700002)(31696002)(86362001)(36756003)(6512007)(478600001)(6486002)(2616005)(53546011)(186003)(26005)(6506007)(8676002)(8936002)(44832011)(5660300002)(4326008)(66946007)(66556008)(66476007)(2906002)(31686004)(41300700001)(316002)(83380400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Q1d0STVoQkxoOG9xb3FKYnpkMjhzQmNZcjhvQWRmMEg5dElidE9nQ3JLYkVY?=
 =?utf-8?B?Z05qQUc0amhRNlE2bDlIQkRCMTRqKzBTUnlPTEtPK2ZWam9ES3NiVmNRN3ZO?=
 =?utf-8?B?bFRpMlZpTHY1UHZOQjFLemE0dFMzbVJNUC85SmIvdHRuUGxsQ2JDVmozSEZV?=
 =?utf-8?B?Rmt0YnBUanJoVFJzTlFpcm0vSDczL3oySTI1N2pRMmx4cWx2KzNJREFzcUV1?=
 =?utf-8?B?b2E4V2NkWFlIdmw5RDF5aHVOMktlcEZ4eFlvYjVZNVFCanpOcTFPYVdQUEJu?=
 =?utf-8?B?eHZSM1dyc3h4UE1UOVZXODU5SDVhVldvU0pJa1lUR0tMUnpoalEvSnB6RE1S?=
 =?utf-8?B?NjV5YnhFN2FKcGRVV01UT0hzMlp1dmc0YnVCWUo5U2hYZDk0eXVJc3BqTklG?=
 =?utf-8?B?MHFLYUFrbGdxR2FPL0tPd3VlWVFvYWpHeVI2TnJsVittVFdjMTh5Y3dVaXE0?=
 =?utf-8?B?MnhEZno5dmtTOWFSU0hBQzNKWWZONnpvOThzcTI3YU1GT0hUU0JMR3RTUVdo?=
 =?utf-8?B?YzZIU0thbkd0bG1hemc0Rll0cXVWY3BjWkR3T1JhQ3kzYzRiaUFBeER1ZjN1?=
 =?utf-8?B?bEFUd1htbkpBdmJCY2pQSG41NlRuN3BZdVNNVkRySzdva1Ftd0swODMyak9o?=
 =?utf-8?B?ZHJMZ2J4TndmZjU3TEYySUg2cTQ2dE9iUS9YMGRkaXZDM1dpdkxxQitZK1JG?=
 =?utf-8?B?NjRMUjZHRS9NNEp2eTUyaEE1bURKUzFnT3pBSDdJL3ViR2I0dmg4VCtGZHk3?=
 =?utf-8?B?UFZ1RnYwMUphbkY1V0c3UzlvWHFNa1Y4anN5MnFDOURjUGYyb1JReGhEU3Fj?=
 =?utf-8?B?elh3SkFyRm5QNVZoNkRmOG14Y044ZXMxME93bXJaZVRQWkd6b0RZMTU3N3g0?=
 =?utf-8?B?SWcxMGUwVVd2YmFBYzhPblZzT0xsdDlOam43UVdSeGRERlJCa0IvdHdNRVgz?=
 =?utf-8?B?c0lFZ1FIUUVFQkZKMjFFSkJkNmtVb0JwSWpSL0VjRUdMdGlDZGFvdDRBVTRN?=
 =?utf-8?B?TTJuSlNEREdqMTZ5Rmlta05PbmZlVlNkOFFVRjQ0QVEyZWhWWnpzQ0xGNHJN?=
 =?utf-8?B?K3BZQWV1WE8yZmpMbVZGdlJQUVo1R1Q1RW9seXYxNG0waUs5WmpTNUl0akJl?=
 =?utf-8?B?RXd2djR5QVl5Y2ZnYWh1OFZBaEd5RmIxTVlseXQ1TTlWM0UrTmxtanNsZE1V?=
 =?utf-8?B?d1cxNnplWFUzc3V1eC9jd3Z6STJudWVJZldDcFhRa2NGdjV3U3U0eTZWLzZO?=
 =?utf-8?B?L2RPS016MUdDdEJlbW1zNERuOTZJdnJIc2w1SEE5OGhvYnVQKzR2Q3Z0TEZF?=
 =?utf-8?B?TVlLT3BpdUNxV3R2V0hxczRDL2lLa2NYT1NUUGl1aUJwMEJYR1Zya2NrTlBY?=
 =?utf-8?B?N1BGTmhGL1dZZ2pzclNIME41SGt0L1dPUkUzMTRLZnZhWjlQaFZ6bGxxY1BF?=
 =?utf-8?B?L0ZUcHl6ZDJOVHpyM3lGWGkrQnFzajRhSnZONUQyd1JqVWJ0Q2w3V2Jqd2VG?=
 =?utf-8?B?bklQNUVZcDZJUm9KV0RBakt4cmFhMC9GK2VVQ3NVTUdLSnNBWUdQMHE2Tmdh?=
 =?utf-8?B?bmprRlZHM1AvV1o5Tm40czlENGIrR0IxM3lxTVFGV1k2RitlalpHMW9oMjBi?=
 =?utf-8?B?KzBTcndxNXJ6cGNFVGlkTzZRMi93azhGZmF2NktIZjdqQVFkNGRVWE01a2t1?=
 =?utf-8?B?SjVQa3JZYkpDaGxxc2tTOWFHc2VaZE9mb1RMVHhwRlV2SWpoSXB5UVUyZEhr?=
 =?utf-8?B?UTV1OGt2a05seHF6dktyNEpLcnlJM2haR25saFp0VU5TdGNlbElQNHhuT0ly?=
 =?utf-8?B?d2NReER3Sm5FeDkxU0FCMXoxbm5XZlNnWE5zNFgwSGJWbmJDNitpd3lFSGV0?=
 =?utf-8?B?MWsyVnJYb0YrMStrMG1UOGxxR1FUMFF1ajJabVVGbEpIdEw2a2Q3QzVDODd4?=
 =?utf-8?B?ZGVYZTd6VllSWE1KbER5Z1MyRFVlcmJWM3lDMkYxMW9RMVV5Z1Z2bS9tN0dv?=
 =?utf-8?B?b1l0UlJwWFF5S0RoS2YvOTRNOFRXdzIybW40bjN6eStUMjZIdU5ZOEJldWJC?=
 =?utf-8?B?UW1MdlA5aVEyN21EQ0xMalU2R2p0Q29QY3k2SUxyRHB6ZHl2Y3Y4UVV0NkRJ?=
 =?utf-8?B?QTZUTTdnTEVUS1htU3BWY0xGak9tREdldGxSeUtPT1lzbVUyOWdjNUhmVi9Z?=
 =?utf-8?Q?7/rM2O10gNzbdgQ83MYTF9Q=3D?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00ad90d0-d014-410b-b794-08db91a61897
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8536.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2023 09:11:16.7841
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YXDSswJDlqnLDRQmehNJKNJVs9ekmGPg3OnmVq5I0o/hMqC5sBC6nI8Aqhq7ESzrlKmIGqbvWYbhfCU+KdviZYbhsllwRb6nZGSob6RK8YqOwHir5FdNFUJTK6g53r6+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7040
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 31 Jul 2023 09:11:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4087

Hi Alex,

On 7/28/23 18:50, Alexander Kanavin via lists.yoctoproject.org wrote:
> This has been around without being properly documented since 2019 (!!!),
> and is nowadays the preferred method for enforcing license restrictions,
> especially since meta-gplv2 is officially obsolete.
> 
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>   documentation/ref-manual/images.rst    | 16 +++++++++-------
>   documentation/ref-manual/variables.rst | 13 +++++++++++--
>   2 files changed, 20 insertions(+), 9 deletions(-)
> 
> diff --git a/documentation/ref-manual/images.rst b/documentation/ref-manual/images.rst
> index d3aeb0829..19c31e0fc 100644
> --- a/documentation/ref-manual/images.rst
> +++ b/documentation/ref-manual/images.rst
> @@ -14,15 +14,17 @@ image you want.
>      Building an image without GNU General Public License Version 3
>      (GPLv3), GNU Lesser General Public License Version 3 (LGPLv3), and
>      the GNU Affero General Public License Version 3 (AGPL-3.0) components
> -   is only supported for minimal and base images. Furthermore, if you
> -   are going to build an image using non-GPLv3 and similarly licensed
> -   components, you must make the following changes in the ``local.conf``
> -   file before using the BitBake command to build the minimal or base
> -   image:
> +   is only tested for core-image-minimal image. Furthermore, if you would like to
> +   build an image and verify that it does not include GPLv3 and similarly licensed
> +   components, you must make the following changes in the image recipe
> +   file before using the BitBake command to build the image:
>   
> -   #. Comment out the :term:`EXTRA_IMAGE_FEATURES` line
> +       INCOMPATIBLE_LICENSE = "GPL-3.0* LGPL-3.0*"
>   
> -   #. Set :term:`INCOMPATIBLE_LICENSE` to "GPL-3.0* LGPL-3.0* AGPL-3.0*"
> +   Alternatively, you can adjust ``local.conf`` file, repeating and adjusting the line
> +   for all images where the license restriction must apply:
> +
> +       INCOMPATIBLE_LICENSE:pn:your-image-name = "GPL-3.0* LGPL-3.0*"
>   

I believe there's a typo here in the override and we should read:

INCOMPATIBLE_LICENSE:pn-your-image-name = "GPL-3.0* LGPL-3.0*"

(note the `:` transformed into `-`).

Is this a correct assumption?

Cheers,
Quentin

