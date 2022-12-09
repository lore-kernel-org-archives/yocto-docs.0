Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BAC2C04FDE
	for <webhook@archiver.kernel.org>; Fri,  9 Dec 2022 10:00:08 +0000 (UTC)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (EUR01-HE1-obe.outbound.protection.outlook.com [40.107.13.48])
 by mx.groups.io with SMTP id smtpd.web11.9552.1670580006956287107
 for <docs@lists.yoctoproject.org>;
 Fri, 09 Dec 2022 02:00:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@theobroma-systems.com header.s=selector1 header.b=D2rlSzYG;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.13.48, mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ACo2ZHzBQDELQQetCchEbvQK2TmSsHVDy1Sd9x5pxOHxX1rLo1HRa/MdFGCBZ4/Oa6Gzc8we44PbWiH+edZC/jfgi9Or4naFx0r72pkngpzpm/ffDnluBEKm8OKmDDKaYNC43s/1SoCrXJTNH0OfO9KC//atz28GsxWHcan4ajUngmVGk0RayjSaRBD0goPWtjWycdvVhJrJtwlslT/1cjvTYO9kNoAvjoaOsrYf8jKfXQRxJuPalhBgrr56zKOm471QClwd8YiNvfJzWS2JdjJDVQHcChLkq70WsP67wv9kxJOR2+QMWwXwOugNVD08zaWAehDOWClCWG+T3v9gvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eyzPooICUvY9DGe+CxSBhu0zv7H28K+H/0uSv5Mt3qk=;
 b=N6v0j6d/WFRjzrYJvDVCX1/HVUuabL7YysfUfI71htJnjJaVctoSXo5c2nMvDnYq2Xj+YMwJ1zlUcIuhR+JX0b3eVfhpM1L35QBFfj81xrnAkUPRSp6H8uEUKn5FYqExqGlib9hgBtkSEeKeWiNK8vTNhgAUzAlkC6qGIE/OsVYOtWJfUj0j9F5M3M7+jVBLqq4E0w2lMW8Dc92lots/i1abRV871eyLwanQznvH0IpYHZHCoLqp32/rsYI3w/6AeKlPKCMpn3oIjvHurt3IrmDTUN/8Qtyt3hHxyHZFbBNMSxA0/VargjhxKfY79CgatI/w2VRV6ezAGjcP0f48ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=theobroma-systems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eyzPooICUvY9DGe+CxSBhu0zv7H28K+H/0uSv5Mt3qk=;
 b=D2rlSzYGeLhLZbLNcoYEYjPk6AKLXx/3sX0wb2KoS+R65GJgKwkiIEPkoJxT2qK2x3WvKFnMSjE2k0tVZUDQ1MAQMC2m2yrFzw7/yIMxFyFoSyha83ZE08y+a3DcW8GUPkPyoRvkKuN6J4ZO+IMGM8XNzENJ3BjiEGObNP188b5QI9g/+vxVZVSz2ijlFckSshsoMGYohwwUx0xPbmYzQO76opE/P7d+N/hUMNN5hL1VJbUK4wpOHzf1TToBC6VlglUHGC53czK0YTA1Mjhzk+kFKqtvdpLhiTnUImCfBXf/0eQ0Nkp0H7hxnx5MFwrs15DSoAKC9exgAmj0i/y6MQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com (2603:10a6:10:2d7::10)
 by DBBPR04MB7580.eurprd04.prod.outlook.com (2603:10a6:10:1f7::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.10; Fri, 9 Dec
 2022 10:00:01 +0000
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::9ebd:cd48:9396:76f6]) by DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::9ebd:cd48:9396:76f6%6]) with mapi id 15.20.5880.016; Fri, 9 Dec 2022
 10:00:01 +0000
Message-ID: <f2f93de3-57ea-1631-e390-785d164f13d0@theobroma-systems.com>
Date: Fri, 9 Dec 2022 10:59:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [docs] [PATCH] ref-manual/images.rst: fix unnumbered list
Content-Language: en-US
To: michael.opdenacker@bootlin.com, docs@lists.yoctoproject.org
References: <20221208142038.14325-1-michael.opdenacker@bootlin.com>
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <20221208142038.14325-1-michael.opdenacker@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0179.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a0::16) To DU2PR04MB8536.eurprd04.prod.outlook.com
 (2603:10a6:10:2d7::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8536:EE_|DBBPR04MB7580:EE_
X-MS-Office365-Filtering-Correlation-Id: a7018b32-c30c-4930-2bed-08dad9cc2322
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	4bqM5rL3/p1zCnz82PYIu2VMOnD3abUxeuqheON+eq+vCChl5jU7el+aP5nxx8fJvR7S7TNww8s64DUtpD4qfdqNe0AUcFQVowIyFI9rHWqV8Io+23EAx6IcQez2s78Ft5IRE2Q3lzrCy+0+bjD/rXwSUDvq3wunYAzX/R9zvl3lfYdVciSOSUCTjWv4+PeGeuh1nPKet2pFc7z6WTg6mfbhxSivCG4dgkkWJ1G4pMjblw9teF8nMeayXcolEfRjALBuPF11AQr/2hfPiWkRnwiFtX8+m9sKzLi/hvJlxlWWCScpsQYvvRJxbWTBBlbfkyqT3BFNR/d9MLfbzPqPRpTQbhO5PqfuI21KTCJ8ur6VYLEyOvZmyGpya1OsUHCUvBO7OOFR10KX+uCNnmEe8I7tpg/wwZHPvGZMmVtbBcFUiWcOu87kEwuPQt+itNgPr4kcpRYscQA5S2wpmjQjYdG3mHxPHYM9HbcYR/MWmm0ivjtt5kZK/Xxsd21nMhJ7Sz9Yl3LK991COtNrAk4RuDuwEDFqIQ1zmb+Ah1v+ExrtVvh9w4+tWPT8eONh7FGjx1KsKyJB9KNDh2LuZLPDGVgrAB62n2MmMda4i43CYdwI6//BgNoyPjr3niC+f2798CopeykBhJ6AAPFVncXz+fU0M4+nRSdYnO93K8lHr4SY7aIV8gcK0OSiLO5wofBsqxyUC8y4dqa7QBG0bGx4oyAdXjf+1KR3CCkory/SSn4=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8536.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(376002)(346002)(396003)(366004)(39850400004)(451199015)(44832011)(2906002)(5660300002)(31686004)(41300700001)(478600001)(6512007)(26005)(186003)(83380400001)(66946007)(66476007)(66556008)(36756003)(8676002)(8936002)(38100700002)(316002)(86362001)(31696002)(2616005)(6486002)(6506007)(53546011)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?M3ZEMVdaQWtVZHFwUGlBai9UVTZPSHlnRzBZUkFpZ0d1cXNuNi9jdkw2L01S?=
 =?utf-8?B?bVNUV1p3RVZnL3NOUzJPS3lmT1FMakIxRVNtVGVqZWVHVDJaT1JIOVJOSGVP?=
 =?utf-8?B?TTFReXY4NjFhWjVvYkFoVldrWnBITlVmcFRyTGcxVkJwcHBkMklpMmhKMmMx?=
 =?utf-8?B?ZG5hejRnSHdkT1krSTB5MTE5dkw4VEdscm9xaXN4dDk5WXN4eCtZaExIMmZG?=
 =?utf-8?B?bmpmR3lEc1VhdktFQnVPVVBiRDFNY2Q2MTB6VCs5T3hmbUVWVU9XTGVWRXNz?=
 =?utf-8?B?SWUyc0N5VG5DY3dqU0wrbUp6bjdVWVJ3ZDdxb2l3N1UxVUZjYVJPYnh4eFJn?=
 =?utf-8?B?S256SlBSWGZkNi9zUWNSak5iVmZuWWpNdGZCaSt3ZnBYakZ5OExraDZoQjk4?=
 =?utf-8?B?NG15bkJ4N1dDTEd5SWZ3d1ZUZngrOTNIRmNwQmVBRGpWQ2ZDYTg1REJCREQ5?=
 =?utf-8?B?eXNRZ2xPYlorSmNxaTlJMlVROWJ2QmhuOVlqM1ZENkk4endDY25Dekt1S0JR?=
 =?utf-8?B?eWJvKzkxbWhDd253b1gwM1J6MkhReEs3dTI2bFM2cGc1YXQ0SWZLVloyc0xx?=
 =?utf-8?B?Y0VWL1BrWmFlWnB6anRHZXEyYmN5Q2txNFJteVJ1blhXaGlHNnNyVFd3bUg3?=
 =?utf-8?B?UUFGWkNJd2h2RzdBSk9zVkgxcGM0K1lWZVhlUlIrUzFtQ3BFQVJSUWg5c2pV?=
 =?utf-8?B?eW9oWTRsNkh3NXBSRm1tcy9PZFlycGZoMlN5Z1R3MWZ4cldicFdPdEdHOGFH?=
 =?utf-8?B?N1cwbDE5UGd6TFZlUVAvSHFZV1pNUkhyZW9VaWJvS29NUGF2YXV5RmRzN2pC?=
 =?utf-8?B?VHRXSldiQkZBMnNneU0rbDAxNHB4NDRGeitWeXEzOUk4VlRLTVR0ZGtuWkhX?=
 =?utf-8?B?RGxRUHNlaEV1YzdpNXpSQVgvU0dMYVJzM1VsVDlPY2FxSEVkYXM1cTBlWmZh?=
 =?utf-8?B?NHB5bDFlcDJRL295ZGZuT3hzb1RZa1JJRzkyTVBIUGlLcU1GanpOSU04djQ1?=
 =?utf-8?B?SGoreGwrTFZRM3p1SFZVbXJzenpITXkrRktkckxOMXRDZ0hqNDl2S1U4eHc2?=
 =?utf-8?B?R2JzYTM4UXR2SEhFdkgwbDBkQ0lIZ3FVelo4SU56aWJWekJ4NzFPYkZPNFFz?=
 =?utf-8?B?bUE3ZFovRDUzWW4veWZtT3daNjJkU1hKbWF5U2gwWTk0QVlMZ1dzZ0ovWGNX?=
 =?utf-8?B?V3FFRko2NUliSFFSL3B3UDlXUHB6RlVKZjZOSEJWTkdjV3ZpdzFlSEdXb2Iv?=
 =?utf-8?B?NTNDZ1ZLVHIwRXBYWGxSSlhUbEtZaWRyYklwQmk4VlFnemhEbk1ObitBRXhU?=
 =?utf-8?B?VzJVeElWdFNtU0dISUFPaElJeW83TEtpWVZzaEthZ2E0SjUzOGpPZDByczBs?=
 =?utf-8?B?ejI2MnZ4VitXU0FreW5PbldsZnQ4eUxVUy9iVngwMnRndmVtcGU1QXZjWk5Q?=
 =?utf-8?B?dE5OOVRNWmsyZitoWXJMcy9hQllYNXZvQyt0QVdGdWFwTDA2dW1mcVFkY0NO?=
 =?utf-8?B?Vk42OW5ibldGNHMrT3YwQjhXMEtzSnFiYUJCY3dZWW4yTWFDUll6ZDYzNDBi?=
 =?utf-8?B?SWtIVWNoeUZ5RkY2ZldpVnRVeDVOcWdmbUFpVkdFcnFWK0FyK3hFREFkOHFl?=
 =?utf-8?B?R3JLUE5EclZCQUhRbjBKeFBVb3ByNGFZK3hGRnJTT3F2MmFxRCtaQTU5WW9U?=
 =?utf-8?B?TEVDWmtyVDl1OEhPdVA0SWVYaG5IQlg0ajZ4ZWxoZnFGekJOQThoanEvbHNI?=
 =?utf-8?B?b0xNNExFcURFTmtUYmZ1b2s3b3JwdDNQaWhyVW95L2czbENwRjQ1ellrV3h6?=
 =?utf-8?B?NUVFTHZmQjBIMkMxd1piWWh3TFJLZkcwSzhsbHpMMWQvempSeEZJYWM4dEJX?=
 =?utf-8?B?TGRPMmVmZCsrRmZGNS9rckd5eEJXRHZEV2VONXNZSGxzSVZTVld1RkM5QmZu?=
 =?utf-8?B?T3QyTVVOamM5a0lsZENvY0pWWHl1WURCZXRrR29nY3E3ZWZiWFpnN1NHMWNG?=
 =?utf-8?B?RjVBQkhZS0pMWDk2QWdQSHdpVmt4YjhQamlRR3VtaG9qb1QvbnU3ZTBNS1lP?=
 =?utf-8?B?ZzNIZUZzTHFXY2xOeXhiQjgvdTJNZHpsajEwdXV5QWhEUHg5ZlliYUdGWjhq?=
 =?utf-8?B?L2xpNVR2SzVRWUVLSHFidU1KWDNveUJnSFBwUm0zZVFtTEo1NFJpZVdNYVhZ?=
 =?utf-8?Q?pyzduFQb74XOhTnOVPOGYOY=3D?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7018b32-c30c-4930-2bed-08dad9cc2322
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8536.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2022 10:00:01.3281
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gb5mRdWC5kaFFM8UfjSYCvaPGruG0mPL2+X/k7/GKT4pNX9fWmMf16RfvwaF8Gf5hwl7gOgpeyaqN/GiaC2WEfJxkrc09H5nvuj4iQ3WiL5EF4xKLGEiYpkhyzI5PwGF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7580
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 09 Dec 2022 10:00:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3532

Hi Michael,

On 12/8/22 15:20, Michael Opdenacker via lists.yoctoproject.org wrote:
> From: Michael Opdenacker <michael.opdenacker@bootlin.com>
> 
> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
> ---
>   documentation/ref-manual/images.rst | 7 +++----
>   1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/documentation/ref-manual/images.rst b/documentation/ref-manual/images.rst
> index d52b39f3cf..bbbbb55d73 100644
> --- a/documentation/ref-manual/images.rst
> +++ b/documentation/ref-manual/images.rst
> @@ -18,11 +18,10 @@ image you want.
>      are going to build an image using non-GPLv3 and similarly licensed
>      components, you must make the following changes in the ``local.conf``
>      file before using the BitBake command to build the minimal or base
> -   image::
> -
> -           1. Comment out the EXTRA_IMAGE_FEATURES line
> -           2. Set INCOMPATIBLE_LICENSE = "GPL-3.0* LGPL-3.0* AGPL-3.0*"
> +   image:
>   
> +   1. Comment out the :term:`EXTRA_IMAGE_FEATURES` line
> +   2. Set :term:`INCOMPATIBLE_LICENSE` to "GPL-3.0* LGPL-3.0* AGPL-3.0*"
>   

I believe you can even use:
#.
so that it's automatically numbered properly.

In any case,

Reviewed-by: Quentin Schulz <foss+yocto@0leil.net>

Thanks,
Quentin

