Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10C75CD4F26
	for <webhook@archiver.kernel.org>; Fri, 19 Jun 2026 15:12:26 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.17])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.44649.1781881942344528961
 for <docs@lists.yoctoproject.org>;
 Fri, 19 Jun 2026 08:12:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=L3DXZc5p;
 spf=pass (domain: cherry.de, ip: 52.101.69.17, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QsMBEmEk6OFLdGIJ6LY+1/P5qFqx1ff61eabdNxvsV90aIu6xA/4fUxFoQdj02WIGzr8tweOiG+i0FfC+97kBEFSLoPrlpoOCzU1lRNS9HV1n1c5roxBA60EaRXI5aAU2jya85ozi4wKC/5IB8RebUWgOK+G8SFa1iLcIJkKR3SOeYgJzROWvwhn6D3ogqFAOYlj7IbT1ur8XL3s4YKegSfLfRgyoc9N2XcO41ohZgmJTIQfWQoPmMH/Gksa7DxRqm4PaKshaK/+6uafjr8AJP94sYQVwbwsQrNphx5hG0lbtjEXrm0R6Od0IVtodzT+m+0S+T9RYd/quikJUedoBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aqIdb7PlcyP3ZE/+JL6IOi3sr/kY2KVjtVg38aLrOU4=;
 b=m//fbVuTgPqhXHTmFhoJsoTEXGecvkoEWvtD+yMUM2RtA+KuAIUAhnPfBh3iSLonT2Nf1BodH/RrC6RM2B06MpUmL8r5MNpUT+/+6g6pPLRoCVZMqqdHIME2HVeK/CwHbALbNc7gXkfj9VMziLXu4SXzwViuDL94rdaAEKuiU9SfClTxuCFsAeFLxCPjnLs4ENDWxAonR9e17gLjWWibT92s89MjnmYcJdZcVHLJGMGNrUON01vzN1+R+7cdv0hnEif7srwsXHTaAIGnPxA0lm8h4wrhMxqYZn22oRk+mFmx4vW9gX2k4B4m13a7yNgCCWdqUjEiiHsaDlwLW4uuag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aqIdb7PlcyP3ZE/+JL6IOi3sr/kY2KVjtVg38aLrOU4=;
 b=L3DXZc5plAxi2SZNWQiezaebEZTaBhZ6yiNsCM/WSzB/SIFefEsvLAKod9qpWIJtbRNNUFtg4hTpmIeXLqRV4nu5bCO7aTASHwySed5mwVi4ClyWkvKrzvReVzh9LO916ZN5OMFf46ydZm8Ck7xdSYx4y/ZFRbSvDBQ9LES+txc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from PA4PR04MB7743.eurprd04.prod.outlook.com (2603:10a6:102:b8::20)
 by VE1PR04MB7342.eurprd04.prod.outlook.com (2603:10a6:800:1a0::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Fri, 19 Jun
 2026 15:12:17 +0000
Received: from PA4PR04MB7743.eurprd04.prod.outlook.com
 ([fe80::9a4e:252f:2fd:97b7]) by PA4PR04MB7743.eurprd04.prod.outlook.com
 ([fe80::9a4e:252f:2fd:97b7%6]) with mapi id 15.21.0071.010; Fri, 19 Jun 2026
 15:12:16 +0000
Message-ID: <202c715b-2a08-4ebe-a80d-c7b63b60c05f@cherry.de>
Date: Fri, 19 Jun 2026 17:12:15 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH] dev-manual: fully define SOLIBS-related variables
 in bitbake.conf
To: rpjday@crashcourse.ca, YP docs mailing list <docs@lists.yoctoproject.org>
References: <cb56b55a-6a0d-754e-a97c-a92c7780ab42@crashcourse.ca>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <cb56b55a-6a0d-754e-a97c-a92c7780ab42@crashcourse.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0250.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f5::8) To PA4PR04MB7743.eurprd04.prod.outlook.com
 (2603:10a6:102:b8::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB7743:EE_|VE1PR04MB7342:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d5aacf7-799e-41d7-ca36-08dece15264e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|18002099003|56012099006|11063799006|22082099003;
X-Microsoft-Antispam-Message-Info: 
	VyNCQjSBExN87fij8mBC4yC7u2VtgU/Vnq6FhjIXfzT9AYw37ph6SPXqB0uMS/cR1/jEhpi9v7keqsOGFBQw1CIfhgjTAVXFhXmJWgrD9eM3pZeoJg/JHLwuZxK7FqEHHUrJTCE50N0YcuuImxSs5pXWm7ldFDJx+akQ0Xbwrxma/BDLLHM/JIA4pY3U9MPycE8awgVHPKB93lVItjpjhzaQqv3TPnUA2Qp2kCTv2gxQe1VXJb0tdNE5jaGVnslDc7HmqdV23NnnzSPh89H4AVkUQVh6GjyGaSuDtneTfxwdV4xktHVLsKZuqC41xPri/EwHYzgD8a6EeWsjL+ut/iE/8wD/Y803kpXA30pZspeNJ+WjIQopU5Vwr3c5JYypsJrAu1+2Koc/chm3tI/WuH4hkXHfGn1aabo0bqoiJFMOtb8zAbQU1tA2C53YXtiTe2BLNny7Oeb8bHX9n3907gMvxQ1aXHjpPRuvtxUZiHFozGR7J728dS9Xsz/Moi2yF/tCsEwULhmzWYFzaugP0HYENQ/N5mVomV2+Zhr85KKa1nEO0rck75E8XhLDQP3K+jgBnn7gAyr2ticQAgpxleurszi5VdBnZZE2nbsUIcJYiw+uLoxfm3/8dDaCi4rmUlQZvlV704+ytvrzcrj4CALHU0GsG0eZP30RdArUNVU=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB7743.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(18002099003)(56012099006)(11063799006)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?UGtXd0RrWEhhRGhjemxOeGFHaWtWNVBxRXpnVzNiVkh1d0Y4ejVIUVpKT1hE?=
 =?utf-8?B?a0hLcDhPcFZxZGNQK0V4WlhWR2ZmOGRSZTFYZWRMYUNLNzdtcGRFS2dtbGxH?=
 =?utf-8?B?T2I4bUpiVEdxUkxZRVFIS1JtVHhFV0hKRXlzQ0lsb2w5TEtLQnFyYTFrZHA3?=
 =?utf-8?B?TzdtUXROZ0YrLzczdnZwdnh5eFZveUNEQWU2Y0tONEplVGMyTy83c1ExU0Ix?=
 =?utf-8?B?bUlsTzdvYkxBbllHUHA1RERJajRDVHJBckR4MDMvc3dPN0RMM3dLWFZmcEg1?=
 =?utf-8?B?ODdGbnRENGIweEZZUjdXVVAzc2xtL3JrR2JIdGpzTkczbFRJenZVVkdUYm5L?=
 =?utf-8?B?WkZjT0hHODNialVzemRMNjFJaHprZGc2bmhiUTBzeStETXdVNnYzT1BIYUNR?=
 =?utf-8?B?QVA5c1c5RUxyT2J3M09UUWYrNkh1Mm9OV3l2ajBtNzAxTkY3bEpqLzlIMHZR?=
 =?utf-8?B?dzRvQ2c2dGdPaUJ6VjR0V1hxSElyUTlicytDdys0N0dmbHhCdTdHSXhNcmZu?=
 =?utf-8?B?WHU1dHllYnY0Q0xjMnlmUGZnclVaYXA5ZU5VMUNTa21ySVFBbzl2M1k0SnhU?=
 =?utf-8?B?VUVhWXAzMDVDeEcyakJjZE1DVjlGbVljbWhEVGlWcmVMY2NvY1g2dkNmL2xr?=
 =?utf-8?B?c2lCSzJ0cTdBS1BtYnFFMTJoYjUyc09OaVdBVTkyM0hMcGtudVRTOEZzeEJl?=
 =?utf-8?B?QWRRb3Fidmo0Mm5sN1hBMDk1My9jNmdTSm1CSGFRZldwUXJMRUZKcEkzQ056?=
 =?utf-8?B?dlBPdEhPM0NWVDB6VUVsWXpMMXVWdWR4N2NwaDBJOGZvZi9OWnBZd2RGNzlF?=
 =?utf-8?B?bXVxdm1uaG83MkNHUGErRVV0aFQvWGw2U0djQnNXVDN5NnRBZDBqNVRhcWow?=
 =?utf-8?B?clR0dW85aEltNFNlelNiRkxOQXhNcnVjRGRvQ2ZNWjNCeitpKzBwMm9WVmtE?=
 =?utf-8?B?YktCNThHd1ZUQW5JcTd0WXZaUExKdGNVRGdoNTU2WXdtOGFRSmdYN3EwMnM2?=
 =?utf-8?B?K1VJbnZSb1YwQkZUYmVZTDk0VndsR0J4TUsvRCtkUXBuL20rY2k0Uzc0OHQ3?=
 =?utf-8?B?UkgwRXJYQVF3SGtyV3JCc1Nuc3BwSXZXY20zbjcrRWhUYURVYXhLZlcva004?=
 =?utf-8?B?TXdFQlJUMTY5UHJpbzhBUjNIb2l6ZEsxZjdremx1K2FreGR1ajhNZ0Iyc1Rh?=
 =?utf-8?B?WWdMd1BtSys0WnJ0aVY4YzBJWkpkL1VROXRkeWpvWitYZE1NQ2xnNDdlTFhn?=
 =?utf-8?B?TjZPS1hRWVZ5eTlmMGpwejRNVFZwNmM2dzdmZlY4TWtCYWFqZ2J2YWxmVUQz?=
 =?utf-8?B?emxwNjVzdHdyTnJsbnZWL1ZDWFdsL0NHMXpNdXVKMkgzMkVoNWVFcitKb21n?=
 =?utf-8?B?a2pJR0l3emtLVjAveHg2R05kTmcvaTNacjRyQVFLeVNMc3lmVGdwMzJSMjFt?=
 =?utf-8?B?QWtUN3VvN044RUFKTEtROTlHWkZmNGRoQmxsaFo3UjBlbWtMRVhuSUtxNXZY?=
 =?utf-8?B?aGdNVzVEWkZtaVZNbS9XdWo0Y0RLVjlDcWR1YmMrNVRuYUNLSTY5R05Ycysv?=
 =?utf-8?B?bU9TWW0wb3pBRC93WElZQjVNKzlVS045c0dMZ2FHUHVGeVVGQ0pBK3o2d2VQ?=
 =?utf-8?B?M0drNDAvalVGOW9uYVh2T2VqeVFSNllaVzRBV2dVeVJ1TG1HZmZqVjUrWmIz?=
 =?utf-8?B?bFhNYmtOT2ltamR2T0FjaEttMkxXR1F2SkllZHR3eXk0U0o4Vy82RUNhVEsz?=
 =?utf-8?B?T0daWXdrbTdDL2NkQXUzVWhQbnhXM2VQSFQ4NlVJcG43UDNqSWk5S0oyZnMv?=
 =?utf-8?B?MXNzZWE4UUpYY0d2QU9PbzRsdXpFN0V5dXBwK1ljRys5cEpzTWplVzBlb1gw?=
 =?utf-8?B?dTRUVktrenBsbjN2RWdndEpsVUFXMVRzTTYzNWIxNVF4aTg3c0ZNeVJ1b0dU?=
 =?utf-8?B?VnAwVmoreTcwZ0JPWWVuV1NuUlBrdnZFUjBjL0tuUW1KTU9IRENvZmRRSTVw?=
 =?utf-8?B?VnN4b1AvUTRvYUlyMEhnZUJ3ZmR2cHNKRmRscXh0UnJiNjVZSTV1T09yY1c4?=
 =?utf-8?B?dU1vd2JiSVUrNnl5UmtrK3JKR1FUWTR0VnpBVy9TcHFJY0VhNXFOTjZ3aVZX?=
 =?utf-8?B?M3BVMkdWeWQ4U3NMdjRTWVZuZTJMeGxUMXlEVWVHVGV5TkhsaXNtTERGZy9X?=
 =?utf-8?B?N3lYNFpWTHFOUHVyeGVhRVNlK252eVVoM1FDRGp0WjArTDNtS2RPZlBMdmgv?=
 =?utf-8?B?aUsyQnhUeEhBaStUWVBmVDJUUk1LRlR3S3NnRDgxL0xpb1kzR3ZvcG9KZzNj?=
 =?utf-8?B?c0hEOS84eWFNS0hoSEFTeHlpL2I4TTdmZkNYa2J4R0dsRXpnb3B2QT09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d5aacf7-799e-41d7-ca36-08dece15264e
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB7743.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2026 15:12:16.6562
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Hu1KjA1e9WP9a9XOZ9JBel49N7KyT/kOOWwlPBHITFPmyR6VNLArjvf5s5iyHtNt5QVcLHlFT0xqn2xVDfGUtqFFrmnEJou92a9+lq+QbYA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7342
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 19 Jun 2026 15:12:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9796

Hi Robert,

On 6/11/26 1:39 PM, Robert P. J. Day via lists.yoctoproject.org wrote:
> 
> The current (abridged) SOLIBS-related variables were not included in
> their entirety so add the missing content.
> 
> Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
> 
> ---
> 
> diff --git a/documentation/dev-manual/prebuilt-libraries.rst b/documentation/dev-manual/prebuilt-libraries.rst
> index 59621ca16..9cc8bd2d9 100644
> --- a/documentation/dev-manual/prebuilt-libraries.rst
> +++ b/documentation/dev-manual/prebuilt-libraries.rst
> @@ -153,8 +153,8 @@ default :term:`FILES` variables in ``bitbake.conf`` are::
> 
>      SOLIBS = ".so.*"
>      SOLIBSDEV = ".so"
> -   FILES:${PN} = "... ${libdir}/lib*${SOLIBS} ..."
> -   FILES_SOLIBSDEV ?= "... ${libdir}/lib*${SOLIBSDEV} ..."
> +   FILES:${PN} = "... ${libdir}/lib*${SOLIBS} ... ${base_libdir}/*${SOLIBS} ..."
> +   FILES_SOLIBSDEV ?= "${base_libdir}/lib*${SOLIBSDEV} ${libdir}/lib*${SOLIBSDEV}"

Funny that the ${PN} package matches all *.so.* in base_libdir while the 
-dev package only matches lib*.so.

In any case, that would be an issue in OE-COre, not the docs, thus

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

