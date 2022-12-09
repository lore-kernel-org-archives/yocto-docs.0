Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7078BC4332F
	for <webhook@archiver.kernel.org>; Fri,  9 Dec 2022 10:02:08 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.61])
 by mx.groups.io with SMTP id smtpd.web11.9592.1670580119090401664
 for <docs@lists.yoctoproject.org>;
 Fri, 09 Dec 2022 02:01:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@theobroma-systems.com header.s=selector1 header.b=eRpyNtxr;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.6.61, mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KWM/hIU4q/79e9jKxBaPaKOJwSF0XdpdrBQ2uiHpirFLoB2v4r1Sbih8xrh7waP3ksaYniL0Qhv7xu3R+R6bHVmJpARmgnjJj5+TAKHmmX3ehHy2dp16f9o287tik5C32m3A57yxJZgsRUcUjVKRnsbTUR15h497vU8jDh6puPSvhO/J2+C8S+exNA6GCidJwTrv7uLtlAjiCU+YAAbciKfD9wHXLimrSFiLt+Trsxnq0VjxI5YNc1kIVpAHoXUPIq0OLhAHzUIRGltVeXRULGJVjFCvrXwnCCTvKGjuqwtqpQS4GKj5p1sdylacYVtbQ3H3eFyJStc5DwZypWMbrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7MtQpcKNhU5/2j3LUXtPjGl6Lz+pEwCsMewVk78+E5U=;
 b=aVlLb/IeTLiFl5jgwjSUhWBYULGkjHJMOXPO0TYnqso5UCVGfXx8ZEXOjX4X1xgRILr42pDt7Efs3BpBT98epzpdle2cBWWjaZemeEDseYlKcU1QL1ltEJ83w8YkmOcIdC//suBK+xpu78FnSzcDt4EhLrTIzIs/ira/S7JQRJIY3Bjy8E50YZgFcmmbp/03s3X9goKJ01VHDXBc5piYeeGTqYH+0+aZJ032pOXf1aW/7/gKXBnMGJ2iK3M02MRbSQu+wWpu/rYusm4ylsMzyBiCQA008WQOxJe91ONXngXZ/L3UGpgNG49sAp4hGDrjk/Be9SCGDj1R70kT/rUgng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=theobroma-systems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7MtQpcKNhU5/2j3LUXtPjGl6Lz+pEwCsMewVk78+E5U=;
 b=eRpyNtxryJc/bxYhuf1FpT220MQRI52iu6mX1LVF8yaoCHa81QiLoH9lELPoFXaVDjg5SJUwqqRJSduHTkiCVEr+jkMSGl7dplgMSDoEhWYskGOunwakoZ09BSqVkN5mEvNgZzKwgLSwQCBM44BwXysuAnR+U9H61goEpJsUrwbaNeI7pWO0n3pbjnubkKLfx3eCtkftD9TB1krBPq4/kvGrxsUg2rq1edIKhG3w/IgMKKvsWecdVimLADRHs4Q3qAddYRfpNff6YnNRqeBXc6PmvszST6Zgp09f2VSjZh6uskBs8FhOawkB/ycKrxfX8lWVvufKXcD6bp2tGZA/Fg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com (2603:10a6:10:2d7::10)
 by PAXPR04MB9229.eurprd04.prod.outlook.com (2603:10a6:102:2bd::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14; Fri, 9 Dec
 2022 10:01:55 +0000
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::9ebd:cd48:9396:76f6]) by DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::9ebd:cd48:9396:76f6%6]) with mapi id 15.20.5880.016; Fri, 9 Dec 2022
 10:01:55 +0000
Message-ID: <21358247-dfd7-abd0-713e-85690fd8d632@theobroma-systems.com>
Date: Fri, 9 Dec 2022 11:01:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [docs] [PATCH] ref-manual/resources.rst: fix formating
Content-Language: en-US
To: michael.opdenacker@bootlin.com, docs@lists.yoctoproject.org
References: <20221208145320.17779-1-michael.opdenacker@bootlin.com>
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <20221208145320.17779-1-michael.opdenacker@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0179.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a0::16) To DU2PR04MB8536.eurprd04.prod.outlook.com
 (2603:10a6:10:2d7::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8536:EE_|PAXPR04MB9229:EE_
X-MS-Office365-Filtering-Correlation-Id: 28618725-7928-43b7-2e65-08dad9cc6751
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	RcpidyFcDdMmI48DgS+JEjx4YroKsJLVu6l//laJyh6/B4O0NQv/5gJa9fqy37z5DNS4WSLyPYee+p22zV5farOYOsLH+gW6TNKGmqL8JpJ5bU+bd6Ls8uwdAu8t0o+uQ05X9/ZD9W/E8dIqUisymIoSo478bIfgMo0OljSLAmASnE161be16d+DfTrcPuHNT2oqnIoLakyGIKnGB2Ka5fZZlVvF1p545vb+xOSE0ijpmLAlvpZ2K+2NIbxt6wCXT/4Ovg/kKIbRvROmVJTOARWbJzpYgx381JD4/VuCyOIlIO6zpv0ASjER1CDRcDFsvAQbhZZCJ8jWv8i53BSYlq578waK9z4kjqVnMX2OLSKK6a5gNIGppxT9PvCHq1g7YYGDw5OQE3M15Aww/kOuPIeF9EgTb+bFYX/0NwZzYgDb0HpebMZ9ER21oRPcgucW1303haXzdprkBb0P4Qx0/lYAKTrsJI3oFX/nyo9oshJYPxDEw/rvs4VKPJjQYv6ARSwSfG/vxI1iOIyPigC+vK85ArjZbyHG/mIGEpLP6kpZE+LbOBjlxO4rZiqCSrmuR6M+pr1nYhzN49vUuWeckLaPa7skEGqeXAcj0bBtSGzrDfs8C/Cq1bXAKeWuAj/u71edDwWtP6w+ozDljr9zMI0PnAX9B44ipeACcPXC4raOZ6uWVFx+6f+wxXuTR5wvmy1/RbCoLW3tfR7nWiwrjQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8536.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(39850400004)(376002)(346002)(136003)(396003)(451199015)(31686004)(6506007)(53546011)(86362001)(6486002)(478600001)(36756003)(31696002)(186003)(2616005)(83380400001)(66946007)(38100700002)(66476007)(8936002)(26005)(44832011)(6512007)(8676002)(5660300002)(41300700001)(66556008)(316002)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?V3JiRFV0eU5lYTdZTUVpbzNRRVVkTXNKQWpIRUVKT09KMXRmdUVjczMvbDBw?=
 =?utf-8?B?VjV6ek5EeStYT2tGakxacWpyWGVhV3J6bHdsZVFKRER6N3djRFNEL3R2YUpP?=
 =?utf-8?B?YlF6dDNMdnNmYVhXMHcrUWoyWWhqWExtOTJCS0poQ1pqR1BrMDNDZUREckt5?=
 =?utf-8?B?M0E0ZHh2R3cvQTVYVmNYcGJPYVZiUm1BTnpyRHVTN3I3d2JwQkRwQ1dzOWlu?=
 =?utf-8?B?RDVIWUc0SXFHTmlUOTFJQ3VFYmczVVZrZ3dSYXlFQTVLd0FRdFM2WEJHUnJM?=
 =?utf-8?B?clhKY1RLYmlXVjc2dzZYajhmOWgwOFBjV2wwTXFkV0dJQS9YUmFXUzdNYlNE?=
 =?utf-8?B?bStRNjdadDU2V0VPWEVkYk94RE91QlJ5Nng5TUhnM1ZnOUk1cVE3NHQ5ekZG?=
 =?utf-8?B?dmdsWUhpbmRQRUU0b3FKU1NRQzgzSk1aSW8yQVRpZjU4SmJxcGxRMFVxOVdP?=
 =?utf-8?B?SkhSRkJUTWpDb3NQU0pGN3p5eWRpYU95NlYwRDdlMnJLNFdDc2Zsbmd4Kzk2?=
 =?utf-8?B?RHNBTjRrT2IyU2NoclVQQUYwckIyQTJjNVppcXorZHJGazdvZklIZ0VvRnZq?=
 =?utf-8?B?VzJNL2loV2tKRWRQbFdjV0lpVExkbE9NeXlMcjhSamRXSHhjZ1lLam04bC9U?=
 =?utf-8?B?Rlp5ejIyTUFtSUh0SUdvMzNlQkJRL05jcVFEY3lieXBDcU90TkVobXJOaTZi?=
 =?utf-8?B?Z203YW1GdEtsS2tFTlBVV3RDd1Aza3NmV3puajJEd2J0WUZWa1hKN0NZUEs3?=
 =?utf-8?B?cnI0ZHNMdGdaenBJY2JpRDhoT3BiaDN0bDBwY2RxenVBN0UydVlPWlk1akVT?=
 =?utf-8?B?Z3l4Wm5FSUlJWE9Jc2htam92QlZub2pwWS9OWmNuVWdJam5CZ3k2L2RsVURF?=
 =?utf-8?B?UTBnT2xZcjNSMEhWZCtsVnFEM1RoTzd4eitqOTVQbHRCRERoTkFobnV3bXVE?=
 =?utf-8?B?ZUlLb2ZSUzg2U1AvMFR1cG5DSVNXRXhRLzZ1aDZaR3FKRFkxRVBENXIzaGVi?=
 =?utf-8?B?NTNjd2t2MVZZMTdHemZldFFUK2l1MnhGb1M3cWk0eldGS08vSk5ldzRULzBp?=
 =?utf-8?B?WnNHOWdZVElSRWFMeUcySjNzMk4zTFdzUHlHZ0V3eGdjcGlaeHd5WlBBbzRv?=
 =?utf-8?B?dStKTG10UnRtdkdMYUhOSGEyVlJvU2VlWkZXVFFtbmh0andVUUx3N0ZieFJq?=
 =?utf-8?B?dUFCeVQ3MWdTK2NSM0dMYzV5cVFCSmJZNVNOWDRBZXgxTHZsS2R4NW5iRUw1?=
 =?utf-8?B?aFVia0tkS3NlUmRWakIwZjUxRUh0clVrc3R1M2FiQTlaWU1EakZhL0ZEYmpI?=
 =?utf-8?B?VU9tY3B6OHBHMHdpb0J5MXQzNWFhclArdzdGdmU0Y2lBcjVUREhmcUZQWVdx?=
 =?utf-8?B?UmVTTk1SZ2wxdzRVUUs2Zzhqb0twUXpMY243cW9NNS8vSStSbFJtV3VNR2U1?=
 =?utf-8?B?aTh0NlJFcTk5Sm5LSGk0T0x4azdIUmdJOEVaRm5BL1dmS0l2OTNrc3Nac0h4?=
 =?utf-8?B?M3Y0d2ZqSk8rSW5Pcmc1Ymh3WGNJenBKOEQ4K01haW9CcFZoVlBWNStwb1RP?=
 =?utf-8?B?RnBkL00wanFvb0s5a0RtTmJrSkJZbFpnNTg2dmJNQWVIOFBDNjk4d3FDV1BP?=
 =?utf-8?B?QXNEV2psMDBIclVONFA5aDFYU1IzYkx5ZkZNUU5BWmV3Q3dKVzVIeEpkb0Q4?=
 =?utf-8?B?ckk5N0NqUm9LR09UQXdEVEFPR0c4Vit0S3JXYTdsRHZYQlh2MVFNbU1zeHAr?=
 =?utf-8?B?M2Q1L0cybkRzb3dxbWJQV3lOMXRwSEx2RE5DNWV1SEFmcEE4WTEwU1V1eG56?=
 =?utf-8?B?Zzc1OFlnbzB5Ykd2N2RCTjh0L3ZKNmVKM1UrOHJqZXhXTDlVY1hqUnRTY3Z0?=
 =?utf-8?B?NVh1VnNobmN5OG5qeXhPUjNEaExYdWhXMExVdmJOdFRiVUNkUm5rYzZXR1RN?=
 =?utf-8?B?eUdXalVzVG9QNnpaRXcvUmkwaGNNNjM0Zkx2TXgxSVNobkFOMnlyd2wveWgz?=
 =?utf-8?B?emdnNkp5a2JNcnhkUjRjanE3L2xUYmRtcWJCMkNwd1Y3OGIwVko4QmRYdURC?=
 =?utf-8?B?c1hiSExDUXRESTY3clpDRGxMbmNxYnhhUW1LYmlEVDJwNENvNjg3WXlFV0h1?=
 =?utf-8?B?WVd0anNaQlBGV3ZLeURNdlFQYkJmdGdONENNeERyRUM5UktCVlVjb0FNQ0Nh?=
 =?utf-8?Q?GnRU80X1wh9xvWsx+TNwHl0=3D?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28618725-7928-43b7-2e65-08dad9cc6751
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8536.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2022 10:01:55.7213
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O7QsHqbfWl94bQavpQzehFfTlMAsPMOtv6tgZOurgMWWB+F3dj4tIti+7gdO9kgCMPrnZQInxNX6rM1yaaiv8a5n8Yb33Stu6I5AHnoQ8Aq6EEapoXVuR4JyDM7bTCKa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9229
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 09 Dec 2022 10:02:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3533

Hi Michael,

On 12/8/22 15:53, Michael Opdenacker via lists.yoctoproject.org wrote:
> From: Michael Opdenacker <michael.opdenacker@bootlin.com>
> 
> Simplify formating for better looking output.
> For example, mosts paragraphs had only ther ":" character in boldface.
> 
> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
> ---
>   documentation/ref-manual/resources.rst | 42 +++++++++++++-------------
>   1 file changed, 21 insertions(+), 21 deletions(-)
> 
> diff --git a/documentation/ref-manual/resources.rst b/documentation/ref-manual/resources.rst
> index c737cba912..fd4aed0164 100644
> --- a/documentation/ref-manual/resources.rst
> +++ b/documentation/ref-manual/resources.rst
> @@ -104,93 +104,93 @@ Links and Related Documentation
>   
>   Here is a list of resources you might find helpful:
>   
> --  :yocto_home:`The Yocto Project Website <>`\ *:* The home site
> +-  :yocto_home:`The Yocto Project Website <>`: The home site

Did you test this?

I remember there's some weird things happending after directives where 
you might need to add a space before the next character (hence why you 
need to escape it so that it doesn't appear in the final output).

Cheers,
Quentin

