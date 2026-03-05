Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 633DAF3095E
	for <webhook@archiver.kernel.org>; Thu,  5 Mar 2026 13:23:53 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.37])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.43827.1772717025315119032
 for <docs@lists.yoctoproject.org>;
 Thu, 05 Mar 2026 05:23:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=kLuUk1Sq;
 spf=pass (domain: cherry.de, ip: 52.101.72.37, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YRAwSJ/4y8fFPa40KZQrDT/01SRO+c+wtzpcHwHsXaEBVFwBMoko8E4I8T6TRBCjuNgZH0FgPykktkkQsbS8JujLAZHyy1CjAYBSiCHBYHiL5/yqGv4dP9P6ICa6pxcwZDTI10HRN119ukHDKOK7fX7OdX8aQSw3g7VCY4hyKMP7fK6OGDH9XeFhkDSEaXBlgBZphk3Os/iHwCrubnOc16BNdFzcyJUIqmvEA2TDqwqRESAkBS2fc5+uBQmZOBnyG8xo++mm47ikElfK91M/G7mtVpkNuIo8SvWYq/xU3PPdQEJ/Ab45qKI1n5bR7hyc8UEUJqgaBN6/yzmkJkz1mQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hmndUkGS9+YqHwej0iFHw3fqOLuY5j97MEg3VD/vQV0=;
 b=rtX8uDiiDs2NcodLB3Mkok5bFgYd7gjQTxMUiT/BNeYar6ILVxdhjx74csG5dKyPg45faDvuFBzBGHpUPxJJru5ofvzubZEP/SGI1MDz7AdQTybcWAbKgixN4iD5W8ovWmMsC7QYSC6R8FH1zVQFxdRQSZFkEpc3/PXQAgJiBepN8fPYPKrOF3fxjDxsWXNHfp+v8waA+6q7LNn7ZpG9ELxTwPcD/CqJrq81Nx77I5cxhCHxoMUQ+uWW/Slr+90AkIZ5LsqY9DG1LJOLbo0oSudFSMqNrT9qKPHhKkGfvqiSzGIIBltMhri+mx9sjwhAI85IGnXY2Ej31P12YWVb4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hmndUkGS9+YqHwej0iFHw3fqOLuY5j97MEg3VD/vQV0=;
 b=kLuUk1SqK7WsgRKVv3QGMfVXxaZ1L6Uu1dY5d1NrrcNCbKHbyZ5YMgfwLhrZEm9/lrR2X1qQWNSzWtvopO6dGLyYPRc/Hx+i9iKO5zNPSfmACgqNm0jSNJ4PswZNhQmjqPOpis5nrS9TgMr0XiKUlpInHHbglULP7oxudLdoPSY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by AMDPR04MB11652.eurprd04.prod.outlook.com (2603:10a6:20b:718::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Thu, 5 Mar
 2026 13:23:41 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78%6]) with mapi id 15.20.9678.017; Thu, 5 Mar 2026
 13:23:41 +0000
Message-ID: <2bcfdab0-de8f-4604-8ea4-cc3cecfb55c8@cherry.de>
Date: Thu, 5 Mar 2026 14:23:35 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH] ref-manual/system-requirements.rst: update
 supported distributions
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
References: <20260302110446.132075-1-antonin.godard@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20260302110446.132075-1-antonin.godard@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0147.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b8::7) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|AMDPR04MB11652:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ac8c083-4aac-4408-96ce-08de7aba6b3d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|10070799003|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	34Mf8NykHtlPyHSxsw3sQBGXyNPviwhQ/S1MyV4t07Beo+TkQJ50pJNtUIGvGFrGBDBQzh1maB0tx7QfUb6w/xYzr7tli4AgP8c8u7tkQlIqmoWFJBgiCr+XrMNBCaLCw/G0jGvf9HDFDa6c5HRDbMNtUVMH7jX5VmX9OplGDHg9TmB0qNQ2iwwurnFwGBFUUlCJzDAI40owrZkryjsRIvPETehi4C9jAC30VRg7ymzFpcjxZ/DfrH7Brmlge2noo4xwSBUqkTDmATxNcGYykkjKWY/GCgfMktdQ0hwvthrfDQMZfDajxIvZMvAOp0PlYyMFNNfyIw0T22ThSFRqdCHA3KqKaNmbRlrOJNmSerc6M8bYObLfvRqI5Q8xslna+eujpfwLtzS2rLTMVzPzdMCZVipwUs8EN/BnfOBthLoBK8StuC+wUoaHQCrbYxY9VxUd6R4aZpjQS95ymCd3oObSMg5u20vhLz8XvP4Inbt4twjYdeJEzjWFaD3JWKoILpYTtkA6MPiNVx7dPLGV1WKAxPkZUVNs8BjyRxwxlE+iqciepOjCJILQlfOvHLaNDC5CL3z4ADLlMl3dg7MDHc5ID69FJ8YOIxl/DH9iLSZ0PbqPwfeRiDBHJIKTnDTIlmHR7BkhivFJXCt4K6DkHjQngaN2LBC+rqXv0eNGLWcRVgWekeOEDygcZbufaR1AW1WDQeEjGDEuBvSriO30CvYef/s/vqvtFdcMKLEOobM=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(10070799003)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?d3hzc0FoTis5YUE3Q01teE1YdG5aV1RsQ0VqWjNBWm13amM4TUYwaFc1QmJ6?=
 =?utf-8?B?ajMycERSRWFvTEsycnBMd256VEptanlJdXRVVlBMK1IydjF0TWQwU2lxLyt6?=
 =?utf-8?B?WVN5S2o4UjBLb2RwTDFxYUZjQytMUTUvemJKdzRETGN6cTlvWldTVlQxaURF?=
 =?utf-8?B?YXZQVE81d2NaSHg4Tm5xejMzQTBTS0dTMXFIaUVEUzlhSWpqUTN1Y3I5QXBs?=
 =?utf-8?B?aDRyWE82WjdLaFMwMHhLaWFnem1yVEVRRGIvQ3dydjQ2VWpUdlJGRUdwTlRC?=
 =?utf-8?B?ZVZjUWlzc0dyT3E0KzFRODV4RHUxclNOMjM3UUdKaHZPYmsxSSswMFVCTUtV?=
 =?utf-8?B?Y3hOUUlHZklqNUIyZkp6di94TjhtOENiSDhvNUx3ZSthd0hzcDM5akthRXRv?=
 =?utf-8?B?U3Q4djBpVHBLMDA2T04rWW84ZTVBY1pyM25LTU9qNzR4cmhKc2VYMnZ3RG1s?=
 =?utf-8?B?RmdvLzJQU3I1SlJmWk1lbGNNaytDc1hHUS9FM3lRY0VacDNXNWltdW1adzVo?=
 =?utf-8?B?VkVjbU9MUXk2Nlg2VHZVd3lnakdmclovZjZENS9ycnFNRGRiUWJCVDJiUGdt?=
 =?utf-8?B?VzVwK2RkaUlDN3lMb1djb3dTVHhqdmxWbzJ2WGVsb29PTENqNERxcXM2c2d1?=
 =?utf-8?B?dm9QbHF2NmFvRWRxMG52Z1VoWEhpNFBSNVcvQkt5eCt3a1NicmlzTFpnak9t?=
 =?utf-8?B?bDRZaGRxK1J2R0tRUG9WRDJ6UUQxUUI3cG9VNWlDZzBXUlJUeWVySW5iZTV4?=
 =?utf-8?B?TTArRDFVSlFYcm5CTW1md2NxcHREdXZPdlVMZTZ0QWNDWXJ4UWVsb05MbE5j?=
 =?utf-8?B?S3J2SGw2TWtjTDBWOGpsTElkd0RhME1DUnR0ajN6Z2ErYnhzRmh4VjYzMmlO?=
 =?utf-8?B?c0pRUHVMOW03UzY4TnZuVTJmVmRoWVhONmRSRy90YzFWMGlkb1FSUHc3Ni8v?=
 =?utf-8?B?VGRleW9nTVYvYXIyS0huRWg1VUF3NGtJbzlUS0FRamVFVjV3KzRCNHpRS0hN?=
 =?utf-8?B?RGtVNXZXZ3h6SHg3Wkk3OVFCM1FLb0lJQ3B3VE9mR1FkRjU3aS9SeUJIblRz?=
 =?utf-8?B?TDVrT3J6MmFHMFo2dUZ6ZzJyZHoxYnJ2eTNCeG1yL0RkdkRzVlFOYWdHaWpK?=
 =?utf-8?B?S3ZuSWJJdUhmWCtYdjgxcy9wVnlrbFliekxaUE52cmhscFYxRVlPQnRPWHdk?=
 =?utf-8?B?OWQrdGxDSHB5WGtOZDNCVFNrNDBSMDhOL3owTUxsdUdFOGFJZ21RM2RvQmZD?=
 =?utf-8?B?bzlsWm9DVFNSQ3NHUXljNS8vSFZTa2RZMVdKZVJoRzJmVUdVS2toVmRhZnpy?=
 =?utf-8?B?S1JjY3RqcG9MdE1KQlowT3V2NU9DOWd2YTNiWXZtZXgvY1VpY3Zhb2VMVFpx?=
 =?utf-8?B?NFV0ZHFhWW1mYVQ0azAwdzczWUo5cXJ1NWtXMGxOVndBVkN2dkQwbkRmN0ZD?=
 =?utf-8?B?V3JNT01LVE9NT3piMXoyTW1DeDA1VHpxTTNHUEdZYS9Sd2Z3ZVVJUmp6cTlh?=
 =?utf-8?B?OVJaZ2ErR1Rxd0hBeGhjU2cxdEZzb1Z0bVVuYmFiSGZNbFc3NVBtZ0hhaElo?=
 =?utf-8?B?My9CNnRCK3gwSWlTdU1PRGlxUmUzRnNTWkQ5MFEvaXFTT21qeWZ5SWlqWHhj?=
 =?utf-8?B?ekViQWd1VHpZV3IveW4rM3RQNks3eVN6UVlwcTkrU2sxNzg3WC9NeHdKclM0?=
 =?utf-8?B?ejJFVVhHWTF5SjFHZW5sK2Nac2cxNmt0akMxdi83UHBWNWxuQ0JFTW0zdWlV?=
 =?utf-8?B?OVJRRjlEWENEUEZvbDM0SG5hb284ZnZ3ck1ERm1UQkRhMUZXTDBsQ1JTa0VI?=
 =?utf-8?B?OGtGQXhRQXEreG16NUFFNzRLTlliellXVjBGdWMxZEkvbjlrOVNCWVFCS0xZ?=
 =?utf-8?B?dTd2MmE3bWdzN2hTVlpSZ0djdk53cDBrTmhIaFZZeE45eXhNOXRrMVQveTNY?=
 =?utf-8?B?Z2xYUWZXZStyRzJFUGRVMExxVUNpY24yZUtRT3dpOVphMkp5Tyt3NFk3MlhN?=
 =?utf-8?B?WXIreWx4WmZ6SmJ4QnhuN2lxekJJakNjdVdLc0JvK0duTXhDeEhTbVhDVEhz?=
 =?utf-8?B?djF3QUJKQlFwaEQza3ZuZlVNYjc4WTFXbXhIRjhJZThNcTFhcUFBalRCMnpN?=
 =?utf-8?B?d0c4d1lFWG9nNktJUkRRMU1rV2FjbGdxM2tJcFp2SUNxOFlUZ1Z0emFWQnp0?=
 =?utf-8?B?UjdEZUgrY3RSd0V5MjU4STliSzc4N05Fa2l5RTBUek5TQzBxcTliU1pGMHY4?=
 =?utf-8?B?YkhxdUtxOFpjc09tMnJtalFNRmx3VktteWh1ajB1VmU2a3RhLzF4TEpicW9T?=
 =?utf-8?B?UHpZYmhRczZPWTZzSXpTYk9hYjB3UFhmZUhFZy9KS21iclVmeEpzWUNtVjdo?=
 =?utf-8?Q?H8bKZtIsVyNbwNuBJvn/hWUc2L/kuAm5+81bB?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ac8c083-4aac-4408-96ce-08de7aba6b3d
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 13:23:41.7012
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VPTz/ivhQPwcqsCk0djidF1V1xBMC+arlimI4FECH8O47b6tg4AURTDEZ7Ht5pJkhlyqXhMadu0YYM/wktjs6gvuRtd7glS+SqrkHX4OS+Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMDPR04MB11652
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 05 Mar 2026 13:23:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9069

Hi Antonin,

On 3/2/26 12:04 PM, Antonin Godard via lists.yoctoproject.org wrote:
> Update the supported distributions list based on the active workers on
> the Autobuilder. Also refresh the end-of-life list.
> 

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

