Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BE19C3ABDD
	for <webhook@archiver.kernel.org>; Tue, 20 May 2025 08:09:40 +0000 (UTC)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (EUR02-AM0-obe.outbound.protection.outlook.com [40.107.247.66])
 by mx.groups.io with SMTP id smtpd.web10.15707.1747728577722359734
 for <docs@lists.yoctoproject.org>;
 Tue, 20 May 2025 01:09:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=ifBbsYza;
 spf=pass (domain: cherry.de, ip: 40.107.247.66, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K8r35OPWIctff2owd+UO9vQmKpqQplbnUIv2ldSgyPVDd86dGmt6YgHAZaQLdnK7IYcH+VyM5INUxZQT3u9nMS491Kq0Bz1/iwSCl9FTSkE6DNklvSmZ56JZC+gZXqfgOq8nJaYhNJWNRcg5T3DHRvvVzjzBzBsqD9soT68xYTTnKNAIkD1QmYWncjYNsbhD8XXAR1QUDVkJp58cD2OeWBsR5Rjjyde0/O7J+Aoyam5sMQ79ydGuVU3w6Bhem9dytgRhMh7I2SE0u6b9MqluYEz4l9J9OXddB+g1Uu4d5Ho+/EcbJrKfNmDRJqUOnHoTS+F2+A4XBTzLftksoTKVtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xgWnx93EBQIwooJPeszdrpjKrOu9D5HWEXExrnewYw4=;
 b=tUvRCu/3mWxzDq5xkjqe9NiaT+UpFv3v5ShFEPAOqxP7M7bVPvOmZXJn1/y6AbF0cYr8x0J4cjO/xCsVHunbAy+eSqzQ99K6kyZ8vq6Cg2hW6O4rZ31uj60V6cScvrtf8xXQbEauPYOKMLXlb6/ly03L4MxnyCYXgoUhAWMja3rz539iJSqCr7bq6KL0YbaxooqinwFWXLAEYAllfVRszsE/JjF0lrchjvQIPvs5rrBKr8/Cmv4McE6s64DXs3wO7ePuQB4X8jzGE45df+SGuf5EFXvmDY4/fcgnI7xNd9xoeo3+gpm1vfYeHBqyi8Bz7dTW3I++DOXnPholNw9TAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xgWnx93EBQIwooJPeszdrpjKrOu9D5HWEXExrnewYw4=;
 b=ifBbsYzaOLxZ7nUwURqQj5ZM4RytO8L3n8z05ZfKJqg5lPawUE0OzPm9+mOMifGknacxQlUUzeI4ZjkYJpdSYR8++SjrzYFu3u2zBysyLbdJMcB0XnsBxdrpm2LSBnSLw9qfkrk9lWXvOPCWziBC9XpSsIA89bH/uBKH6P6T8fI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by AM8PR04MB7345.eurprd04.prod.outlook.com (2603:10a6:20b:1c5::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Tue, 20 May
 2025 08:09:31 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%4]) with mapi id 15.20.8746.030; Tue, 20 May 2025
 08:09:31 +0000
Message-ID: <d5625020-f356-4748-be6a-dd524d241e8c@cherry.de>
Date: Tue, 20 May 2025 10:09:30 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] ref-manual/variables.rst: document the
 INITRAMFS_MAXSIZE variable
To: Christos Gavros <gavrosc@yahoo.com>, docs@lists.yoctoproject.org
Cc: Yoann Congal <yoann.congal@smile.fr>,
 Randy MacLeod <randy.macleod@windriver.com>,
 Antonin Godard <antonin.godard@bootlin.com>
References: <20250519191718.6230-1-gavrosc.ref@yahoo.com>
 <20250519191718.6230-1-gavrosc@yahoo.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20250519191718.6230-1-gavrosc@yahoo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0130.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b9::18) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|AM8PR04MB7345:EE_
X-MS-Office365-Filtering-Correlation-Id: ae62408b-fd3e-4f1c-ec8e-08dd9775a647
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?N1hJUmVsQjJBa0NnRE11MnkzSzY5MlhtZ1g1YnJ5YWxFcTlNM1VqT2tQVWV1?=
 =?utf-8?B?RFQ1NTFtaGticUdtelFXa0UwdHM5VTFoU0RxRll5N3pqZW9xZ09sTTluR0Nn?=
 =?utf-8?B?dTI2SlF4QXZtMXIrN3YwM0RTc2NUWTd6QVNmaHFPRDJYeld4Zi9tdHFrSzFB?=
 =?utf-8?B?ZXdUQld3MEZ3QlRBWjFSVGFSWmo4QnAzRHFLdlViUVVmN1Jnay9KZWVRaUZ4?=
 =?utf-8?B?SzV1Vm9sMzNnZWxJczFOcWVWY2cxZnFIenFsdER1RStEcGUxZHNobkYvRUlw?=
 =?utf-8?B?OENESEtOeCtkeW5VaVUrcWhMRGFRRDZyQzBZZ0l4YVFwR2p0NGNNMSthcGFo?=
 =?utf-8?B?NVRuV0dhYkYyVnIzTS9WOXFac3ZCbXRMMm9uenFwZnpaQ2hnVjMvODcyTzJI?=
 =?utf-8?B?cC9LNndMbGY5OWg1cGRrUFg2Qm1CV2ZoT2J6dXdnK2U4YTV2VnM4bkNJNUxJ?=
 =?utf-8?B?Sko3ckhudGZsbEUyb25ERWNxbEFpbFY3ajk4dkJFSW14dzBaZzlPbDAwSE5o?=
 =?utf-8?B?UUxVVytURElSOU5WeVVZQ2E3NE1rQ0x3a2tBdHk3RUVUdU13TTlqbWZpdkpR?=
 =?utf-8?B?VEZQK2pjTit5WG5rR2VUejlycjJLeUFIOTc4R24yeVpGWVk1dDJEUFFrMVgr?=
 =?utf-8?B?QUZDbFlyQ1RXNjZzR3FJWGZONWt2c0R1dWhjaW5OS1NjaVdpejl0N2R3b2Ja?=
 =?utf-8?B?K3dGSGdKZUlVc29xR3NLY2NVRW1qb1dIdnRHY3lUNlJ0SnNnUHcwZEhSalM0?=
 =?utf-8?B?dDV4SFJkUXAvRTFwVUFvcTZmYzlvc0QvV0R5alg0TXpvRkRGajcvTXRTUk95?=
 =?utf-8?B?Ujh1RlhnT0pmNVVnNmZiUGVwckljK216aHo5Vi9JUDFpeEE2YlJqc253Y2k0?=
 =?utf-8?B?K21KemwvSGp4YzhzRHI1Mm9PVlp1emxHQ2hqVkxWNlRFbFhYREpYWjJXckdk?=
 =?utf-8?B?eWc1anVIaVhnUFNlQkFPZ3lWcEhjRGFKWnc5ZTZPQ3h0UU5zYS9CbFg2a0Y3?=
 =?utf-8?B?eXpqZnBIU1Z6UmFySkVBaWFDcjVscGhuTk9EVkZHejAwRTFkZktUY0ZuVFBO?=
 =?utf-8?B?WkVxZFRiT3RTQXZoWE1Hd0hFRnRsNC9mTXk1OVFGSThlSlpwMUZHMlFOaGQ0?=
 =?utf-8?B?ZXAvK2ZwQ1hJUUc4WFd4RmRXN2I0SEJKZHdpbVgrNFp2NVRKQ1didVhsdUFa?=
 =?utf-8?B?Q0sraGJVd0lFdUc3aVpUVUl2ck5RZStzd0YrQVV6c1JWdGp0WFVEaitXMURi?=
 =?utf-8?B?ZkFjOGk2THRXWXNtWnBxSXkwRGVFMDllamJhT3htRUh4MmhLa2kzaS9wZ0Ra?=
 =?utf-8?B?WnAzOUNvVFNJREdNb1g0ZmIzNnJRNktPY1B6bDlLRkxnZWNBT1c5UlkrVS9C?=
 =?utf-8?B?MHVSd2ZoSzZNemZaZWJyYVgzRkRsdlJoZEhlVEtYOVQ3eE1TZ1VpdE1oYzE1?=
 =?utf-8?B?YldRMVBLelhCZHZtQlMrWFRsU1RqQ28zN3ZGbEFSNVptZjlKVWErekxBeWZI?=
 =?utf-8?B?aDYrSFNFMnlmUDZpZkNRZWdUeGhqeGVvTFlkWmZ1dXRibXJ1Y00xOXlid1Bx?=
 =?utf-8?B?TXNuREozYUIwMG5ZdWhyZVdDNWFHck94bWZEZnFZOWkzam9XRFd1T0FKRXFv?=
 =?utf-8?B?MVJhMEhyVTRMb3UzYTJJb2xwazN2cGFuS0hGR0hQcVFwekpmRVc4aHFnWk1X?=
 =?utf-8?B?WWtjR2xPNW5xempUQjQ0a1Q5YXVETEVLa1kvdG9SWjdZNDJjQWFQZEZDd3B6?=
 =?utf-8?B?Zm5iQkZLYmlZMjhPZzZrN09mTitJRkVrWWRTWXF2YWJTcGFBZ3JlcDEyNTdw?=
 =?utf-8?B?UXFaeFZLL2pXN2xYMnhFWE1Ic0QvUnhkVmZZbVpwcm85Y01TY2lheFlBSU1q?=
 =?utf-8?B?TUdlOWpGdndFOVo5ak1zZFVtWTJhdW81a1RLWUFZcHZOSE9ibUN0cVJDZDMw?=
 =?utf-8?Q?bfqabx7ZYD4=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?dnE5NXBFbkZ5dk45c3g1OW5kTklFbWx4NGRqUWlGbUU2UGlFM0Yxb0VjSnJR?=
 =?utf-8?B?bUNkd2xtZzgzaEtkSjRCS2RqVTg2azlmVXkweCtDOGFzL29IVmFEY2pSbGxZ?=
 =?utf-8?B?SUorb3ZybnJmZTV5YjAwNEhWak9KMnNFMkE0alJPdlNoTDl5QUhNdjJFeVY0?=
 =?utf-8?B?SXhwdDlpdy8vZHo5emFUaUNSK1JDemQyMEdBL0hSMCtVNmpvWk9tOGVqWE1D?=
 =?utf-8?B?Y3BkSlkzWi92czcyYlJJOTFCT1pnaXlMUTlTc1JpaDU3T2JaZGRpdEkxZzBH?=
 =?utf-8?B?amdJNWM3N3hlcnhVVU5NY3lhelpTVGFRQVVheGx5RzE3bFd1T2VBWWt2c0U1?=
 =?utf-8?B?dzFmblVNQlB4ZU8zai9NUVY4OGVxblhWSGZRZ0RsNDlUZkwxb0IyM1pxTkdl?=
 =?utf-8?B?Y1R2Y3h3RGtkVFR3Wkp0RHZVN1FFcTRaVExjY0d6ejl5N0luc0JuNTc4NWJi?=
 =?utf-8?B?MmJmSTJ2Tkdlb2dnaG5pUnhYaWpwQmx3cnVSQ2RnaWQrUFo1MVB3YWxjdGVM?=
 =?utf-8?B?cWhvcXViWWhxM3FaaEJIbCs3SDdYNEhFcExNSHZQdmwwajVWUzRKaHhhTkIw?=
 =?utf-8?B?SnBPS0d2aTRVMDZjekliWU1LRjdENkRiSmRRRnY1YWdIRUpFT0toYlVFc2to?=
 =?utf-8?B?VjFIR3F2M01sTG15ZlhzcG9aN0ZWRm1nc3U3ck9FOUJmSUhmQW0yQW96NFd2?=
 =?utf-8?B?T2FkM2hMSEQ5WXJVVThDVUFNckRQbmwrRm1kQlFveEYvMjR4NWtiS3N2WUFK?=
 =?utf-8?B?NEI4azZjYS9zU1I0L0F6ampVaFZjRllhNlpXeHM3OXh2RU02MHV4U3pncHpN?=
 =?utf-8?B?Rkp5ZGljYkhEcUR3VXlDTjhnUE4xeUxDRHFqRkRQNWlKMm5MZWVyTUdpSzBi?=
 =?utf-8?B?SVV3c0ZDYVRBWnRNb3RIQ0lVenltYWNadG9rbXBpY3EwSGdyZFIxVVUzZGRt?=
 =?utf-8?B?Zm4vQldONlRnVHg3Nkx6STlMNW5SN1RBdjBxMllRZWtkN0Fwa2pNSnEweDBm?=
 =?utf-8?B?V3k4OGEwVWhMOTJiaWpGdWp3bWFVQkxWVHVheTFLUHBSL3VIQU56RXBLaGFJ?=
 =?utf-8?B?cmtLNnhEd0tjVGtPWXFCeFBDOFkzY2JML1VSQWhsMlhlTzNJK3dSellNZ3gv?=
 =?utf-8?B?OE1lYjdobGpLN29oZDJpMlp1Y2xkV0ZSZHVWZXZ5RkE2UllXcEY5d1B4RkFv?=
 =?utf-8?B?aGwvRFovRkgwRnZkVS95cW9UbFhrMFdtSkk1NVFNVW1EdWlHN2dTQnpUTW9l?=
 =?utf-8?B?bVdCTE1ucjh0Y0xFRHVaZnFUc1JmTUJYNFBIMEwzSzFyNGlrRit1ZkIyVks5?=
 =?utf-8?B?c0tsclVSY0dCSHZrSGU3b1ZjU0lDV1k4MitMSCtXeFo3SUZacGxmUjZ4dnJB?=
 =?utf-8?B?ZEFtbG1MV21zdTFzM1IyNm9pMVJYOEtsZUc5ZjhKaTJ2cXozSjFIaHdVZEh6?=
 =?utf-8?B?aEFVbWM1K3lPeERUbmFrU05CTTl3UVRyUVcwR2o2Q2p2ZDNZb1RpSEYzdlpa?=
 =?utf-8?B?ZDdrRkg0eSs1a3hBTGpWSEl0bHFUdzIyWHVScmpUT1lOR1hwRDlhMDBxbXVq?=
 =?utf-8?B?SEVLRGF0bDROMUFzTVczdTg0V0RDTitzcTZGVzZ2NHg4ZTc0SWpYM3ArRFNw?=
 =?utf-8?B?VXA5MVZCMEFkR2p2b1ZoenZWTmNWRHEwZVVGNTEreXpnbFdOWHJMdE1lVmNL?=
 =?utf-8?B?dVdVL3MvS3ZGWjNCTWlEa2c0eFpkL0pNeko1Um5Ka3ZzQStNcmwzQ3NHQ0Jy?=
 =?utf-8?B?SzNZczF1SXo2K0ZRcnhjWWFiMlc4aU5PRzBRWlg3bDE5bmhPZzJud2oxQkJH?=
 =?utf-8?B?Ykx3KzdUUTBmRDhkcmhSQ1c1VXJUQkRvaUR1Y1ZyTWQ2RHpqUWt4SWZ2QUxx?=
 =?utf-8?B?cG0wZWR6bEJFMmFSbzUrQmovemFHeXJvWE1ML0RWSkhiaDYzRkhGVU9rTmpv?=
 =?utf-8?B?TVF5UWx6THoraG5TRmFtalFxVjYxNUlXeGIwSW5sOURkVXVTYzlpWS9XdWhH?=
 =?utf-8?B?UEwxSmN3cWp0dVNQYVpENlI2NXk4WWtHY3dxVms0blZ6QTE0OTFoSUdPaVpz?=
 =?utf-8?B?NGI3czNxcXlHWTFZbHFsemExa0lNMTlvWWNJZzNENy9VUW9WdFhSMWpOdHla?=
 =?utf-8?B?bEtRcjZPd2duOEZrSjRGamUyUzZwRmxiYnhJNWhDeEVXaDVYM3JIMEJrYWR6?=
 =?utf-8?B?QVE9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: ae62408b-fd3e-4f1c-ec8e-08dd9775a647
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2025 08:09:31.5956
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6keIi6d34NLaCeiZgisX1GvIRUkshdTwP+6rDSePJcDW4lCE/5zhA62w/u8dxky0Z3csfyvLDy+SYJmltHF6ETVQjT0VSXcHfKUEvCuMztM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7345
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 20 May 2025 08:09:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6844

Hi Christos,

On 5/19/25 9:17 PM, Christos Gavros wrote:
> This variable specifies the maximum allowed size
> of the initramfs image in Kbytes.
> Fixes [YOCTO #15797]
> 
> CC: Yoann Congal <yoann.congal@smile.fr>
> CC: Randy MacLeod <randy.macleod@windriver.com>
> CC: Antonin Godard <antonin.godard@bootlin.com>
> CC: Quentin Schulz <quentin.schulz@cherry.de>
> Signed-off-by: Christos Gavros <gavrosc@yahoo.com>

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

