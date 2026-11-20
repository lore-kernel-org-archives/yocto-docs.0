Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.18])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2453.1795166193868541054
 for <docs@lists.yoctoproject.org>;
 Fri, 20 Nov 2026 01:16:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=no7xYD8E;
 spf=pass (domain: cherry.de, ip: 52.101.66.18, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=miTwtbyBUCNWh77NXVEbG2A+WzlZYnPFkrUdAVUijFXkSpD3k114s+eCqsPz3NWPt0jupJuSmqtRK07GW24pOnPNm35k3TceBYglBZGKxx7DHawgJttDO+ZEqL0KwSsZrujzC24t4mU/W+dQK+CRdB2RPsX+Ls77gap5pM73jaKJfI7+0bdkQkLYp08yVwr1i5Cilul12Uwl3nww9PePnsL83DhgFtaTX4zAdj/wz1+cPkrMPQCa4fWhtFJyiiOQ0Z5pfFpImgG6ZBCIJIC7XuKOHAD3+ab7R7wt3UEE3IIx6r9MujbmyJwOxRQeYpoJMeMAt8adxVPSioM9xfR+mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H/xKKJJ26AeRHpjPR6kAMBIaZSK+zMzIPQIklV9+Zks=;
 b=xCQjx6vMIJ/w82WZHTh39x/nxbfWf8dTvAgmYJ9TK+30reR6h9ilZxG2NpfHPAuFzgoMwMGNd8+8sveQtDpEkyPHM80DJbeX3TLyxQczpIDY31W/u9n3g7GZ+4SeoMfHGGHPx/snRVkvcfZl4kD8jqv1OHiGM7O2JUd7UaManNmPJ35IjMkp39ciqSU7RSgaNAGbYHjZIcMpD1BnD3Jn/xFNlP3c2Vtlavgizy+9Kw//k1O8fpRy8eU0FwFCSrwiPCy63snQobPQap24AwQBitPh3SU6BBQkyyUg0iIoDXUw4JZhs8DQsZU2Y/gRSZlFZr3V3ek3laj9o9nfPSM/0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H/xKKJJ26AeRHpjPR6kAMBIaZSK+zMzIPQIklV9+Zks=;
 b=no7xYD8EiyFGui2dpRTnVn99K5jhZY/EGR/chlnQJVaN+BnXTv7TuqMCxYV1D9/n+412MixMME9dn8C9MvTcyoonKPcztGtyekxVBLXTBYZDFTPKNg/gP4mfgR1dP1NlCbaHFRYsAnyost3TYZm1vlW52g6iv16gp1X089OKvBg=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from PA3PR04MB11153.eurprd04.prod.outlook.com (2603:10a6:102:4ab::7)
 by GVXPR04MB10181.eurprd04.prod.outlook.com (2603:10a6:150:1b7::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Fri, 20 Nov
 2026 09:16:24 +0000
Received: from PA3PR04MB11153.eurprd04.prod.outlook.com
 ([fe80::6b02:c0eb:95a4:3c3d]) by PA3PR04MB11153.eurprd04.prod.outlook.com
 ([fe80::6b02:c0eb:95a4:3c3d%5]) with mapi id 15.21.0639.010; Fri, 20 Nov 2026
 09:16:24 +0000
Message-ID: <6d6b6af3-7a6d-4718-b438-672a9643b6c0@cherry.de>
Date: Fri, 20 Nov 2026 10:16:23 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] tools/gen-releases-svg: store docs root dir in
 variable
To: Antonin Godard <antonin.godard@bootlin.com>, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20261120-gen-releases-svg-fixes-v2-0-abc66b9dd7da@bootlin.com>
 <20261120-gen-releases-svg-fixes-v2-3-abc66b9dd7da@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20261120-gen-releases-svg-fixes-v2-3-abc66b9dd7da@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR09CA0119.eurprd09.prod.outlook.com
 (2603:10a6:803:78::42) To PA3PR04MB11153.eurprd04.prod.outlook.com
 (2603:10a6:102:4ab::7)
Return-Path: quentin.schulz@cherry.de
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA3PR04MB11153:EE_|GVXPR04MB10181:EE_
X-MS-Office365-Filtering-Correlation-Id: 84cb9e11-db04-40c1-2ba6-08df46e6f2ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|18002099003|22082099003|11063799006|56012099006|10067099003|4143699003|261026121527099003;
X-Microsoft-Antispam-Message-Info: bbyK9TNTL7CrH3Bktlt6gw8K1AsG7dAL7Jnt1Gsavr6hqu3BWF5/zdVWTUveIQaw/dGsmWZy4feCXJsSgggstQ+K5aRYfzZjznRxM5J8ViLsgPmQy8HF1nFrxxvFxfOM5Rq6lBPCeq4ZRMek3DNPN1r1mQyoJJ3m5ZhRDJ4mpOZb3n/SoR52eaj7BpUKgGfMJiQXFDbf81ksAXtWlQyGv04dyK3l1eX6b3z79Xwr88E+toJKGPgNLcJpJNRcGfTIVjlaDSFYBwiB+tC0jAgJhIikIsjxOSjTbgZyzsw+pzUsUUcpmj2tNeQynIR/hSNrW6oGnfyWVzva7HDinvSUAN3yh13xlzyBncNevZ9soLR5ZB5AbPQhuqdQVxZh1SmrPOHhWIF6T06+CXJWyiI74PPZ+yhlZjSBnMtq8fyxrr/zXoHxe8acgE+Q9tCv+QJ7PhndmMXdOxhQbaCIZsOfle0JKFnrVZ0Hqz2ZiDcDoGwZpVRQQhlof0BsUMeald3+6ha6hzYpN0Ouelk7zdkNJ+KmM/gB3ItPFBtwqxYBZYz81eBdddXwmFcZFR0LM5DRB5UGYV2iqOmByLyGB9TpFmVhezJCiDgg4lwRNVDtcxZ+8H7WFJqU3Pog6/K8h5Z+Mbty2vNPyBswHCRejd46lxeXwwFZ1Tzxc9sFyMa/NZ8=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA3PR04MB11153.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(18002099003)(22082099003)(11063799006)(56012099006)(10067099003)(4143699003)(261026121527099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YklBSzlsSW1RbHVIUDdQeGxCTGVDS3lXU2JEUjdNVXFnZW5ybFNvVEkyWEw4?=
 =?utf-8?B?ZkJmU1VPYmZ4TlJXK05vMmFveklUVUpkMGFkZHZPYnNXZlJRdjZyZ3o0UmpS?=
 =?utf-8?B?bG5aMmFuUWpYamxvLzBJdSt2QWRvM2hlQnZSRzlaZXJ6QnY4VFJMMTNieFVp?=
 =?utf-8?B?dnJZWEVUdVNCZ2lrZitkMk5McExMdnRFR1BRS2I0R3hBUHZzbFRRclJ0aEtD?=
 =?utf-8?B?Qkp6VDFvelpXYVR1Sy95L09iWEtzQUJsemk1MFBiQzR1akxWMWZjdDhrRUdu?=
 =?utf-8?B?MElkdGxvUGpoY1FmWjc1MlEyQXZrdDRnZjZ5TUpybXlOZi9jSElLLzFwNVVC?=
 =?utf-8?B?VW9QTHVlTDU3NkROV3lnRFZBeTgzNVVuQlllUHBsWUZFNDFLSWdGY2JWVVhS?=
 =?utf-8?B?UXp0dHNqbXhJTGtnNVBaS1dQWURoR0lkQUJjZituaUtTQ281bGJMQzFGS2dx?=
 =?utf-8?B?SGhWYVVScUNXUExTRTlRR3NpNGtoZm5LS1AxNnVGZ1B3Y3FTZ0NaZEUyMlpX?=
 =?utf-8?B?R21zamVCZU8vWTBJL3lodlJJTGVjVGgyamh1d2RWamozVU83M1NFUm5JRGUz?=
 =?utf-8?B?THVyZVlTYkhxalZiZS9OckNOeE9acDRhVlk3UGJFTGwwTHFBeStBcnRWR29Z?=
 =?utf-8?B?cFdEVVF0UXpGTlVJYW9LUGgwTWpPc2xWQnlxRjVXR2I0M0xrT2g0MS9LUDB0?=
 =?utf-8?B?Nll5Nk03TDZkeWpjMUQrU3U1ZkFOYko4WGpaUEh6SFlaSnpJei9NeTQzUGly?=
 =?utf-8?B?Qk91eXJmUGdYUDcvNDYwaGNCaVlrbENFcWxUVlVxUXZHZG8wZmMxSDI3L0FZ?=
 =?utf-8?B?MVNISys4SUxqQUs5Q040cGEzeEZGR1Q0bmRvSllYQWFuWHl2eDIyRGtxdWpl?=
 =?utf-8?B?bEo4ZFB0ZEtHYzcvb1NseFFMeHNuK05jbWh1NFFiZFY0RWRQZ0ErZ3hBYVNl?=
 =?utf-8?B?UUZhcGhzM2luM1FYTnlOUGxHZ1Zmclh5b0UwOUFEb2VVVUtVS2tnT0diWW4x?=
 =?utf-8?B?M3ZLOUwxSUlVRTNaanI0bU9URG9IWDlnRDFiaWVncUE1SkNlN3F0RG5XR2x6?=
 =?utf-8?B?VEI1RlZjRFZBNktkT0hoSWNjUXc4WFlyRkNFOXhvRmRBZXdMM28wa1E2dVEz?=
 =?utf-8?B?Ynh1cG9aRUlUOGxYa3h6ZWgrSmg4OGtjNEhaYnA0bXZCK1RpZjAyWE9IUG93?=
 =?utf-8?B?MHJ2V0l0K2hQcUhSMnBFbExFemFiNUpSbjBwYzRvWE5seHVOaXNUMDdicVhn?=
 =?utf-8?B?NTh1RFh6TUd3RjZSbmlMb2YxYWZWcm5KRUJNUkFKbGV0QjJUcWMvRkJuUWdu?=
 =?utf-8?B?c2pLYVdrZDBJaVRMamlLS2RibVBqUTRSQVo5alFzci9FaEdsR1phdFBWN0Zo?=
 =?utf-8?B?MkpxcWE1dDlJTzYzOWZiQldSZzA3NWVQQThjQUVXVSsvSE5DM2lvWCtpeEVq?=
 =?utf-8?B?UUVlMEJMOU9VSnd6c3ZNVGt4b1p1V3RyOE9pMVZVYUJPSlZTMmtaUnd3Z1ox?=
 =?utf-8?B?RkdkNVM3S1JZeGlTRkZpU0tEQ2RJWUgvVzMrK0ltdFdWYzErUTZyeVhha0sx?=
 =?utf-8?B?elFVSDNsZ21qUFp3Zmt6VnRTaDE4U2wvb3EzZk41cmNEc1lNR1F2UFNxaVpx?=
 =?utf-8?B?VWVrYklxMEdXci81aHVheERBMEl1OUJhTFI4WGoyRXZhNVFsTHFuekdUeGR5?=
 =?utf-8?B?WmFqSHd5OEV3UDRwQUVseEE2LzhQRnhiSURBWFphVzlHd1Z5RGdNZVJVZDRS?=
 =?utf-8?B?WmRYOGUxdStaMVdyeEo4Ly95cTU3L1FNZzE1ZVRIeVFUc2tKdTQxeTVWR3VG?=
 =?utf-8?B?ZEREbnppUDZUOFRMbk1VR3pRQnJjSHdjRDMxU01FUEtkbW1IQkswZ2RhdjNY?=
 =?utf-8?B?TVNWS09Kb3h0K1llWENybkhZQkErdlV3bkMvT2gvTWpEZFoyS0tlYkhUREho?=
 =?utf-8?B?VFN4RndOaWxycVJIOXdwS0FhZndMbS9kT2dXMDh4TVRpaStJM0hDcTVucG5q?=
 =?utf-8?B?R212WlRPQ3hDc3ZnUmdEemxnbkptUGE4YUNGMXc0OXVsck9sNkNpUHBOcjF1?=
 =?utf-8?B?VENpVzBmU0RXSXZRUjRhZ2I5bWl3T2t3VVcvd1dZT0JjMnFpRkhFYzNxcU5Q?=
 =?utf-8?B?cjBONkhMYjVrcUlkblBpUnA4WDM0RlQxTGp4MGc2N2cvZTQxcE5xU2VJTTl6?=
 =?utf-8?B?eXdSVVdIaWV0Wk9vOHJiQzlRWFhFNzNnYktoU2NoOEswWlcyaE1FbjBGVmxZ?=
 =?utf-8?B?aW5FSktobElwMzF3c2c2RW83SElYaStMS1pUcnlVZVY4RFIwb2F6dVpqMlVV?=
 =?utf-8?B?VXhQSnFydU9kN0hidER3SGNubHE3eFBCSWVPUGFWdytZbmlrYmJHZz09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 84cb9e11-db04-40c1-2ba6-08df46e6f2ac
X-MS-Exchange-CrossTenant-AuthSource: PA3PR04MB11153.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 09:16:23.9822
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NksHI/iMgjUppcKoaXdH6qEzpX7XuJXiir/HoARG7gFjJT4uK0I4Jobp6HJBGd/ENnV1m+XtYBuHLJTqCAM+SwmsY7TT3qrOJZYl/ZET1/I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10181
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <docs@lists.yoctoproject.org>; Fri, 20 Nov 2026 09:16:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10814

Hi Antonin,

On 11/20/26 9:14 AM, Antonin Godard wrote:
> To improve readability, store the documentation root directory in a
> variable and reuse it in the default assignment for -i and -o.
> 
> Suggested-by: Quentin Schulz <quentin.schulz@cherry.de>
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin
