Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5BBAD2D10C
	for <webhook@archiver.kernel.org>; Tue, 13 Jan 2026 14:17:42 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.59748.1768313857060027317
 for <docs@lists.yoctoproject.org>;
 Tue, 13 Jan 2026 06:17:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=fwcm/t4T;
 spf=pass (domain: cherry.de, ip: 52.101.83.50, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dNuMUoJKEjVsXKy6EPDevw/b4hIs3c84p9BoumziMT1odCpLxK1itSJh6Py3WnOgMcK7HRpiF4glyv1DKp63bD7/vhWwznz8/Qm+I17sYuXQvPHeZfcVvZF5ZXT0lfKWAXJgzMxMEY4eSHuJlWmTbvKEocd/SQStDgoa97IBhLCpAPzNv2EMQIF2C+bNzGr3OrsYmCbvh3OVSVk1Mrk3vTfjlUyDmoNIlTjC4h+bYQQAmLohZdzIEK7WFLpO//wE0xQ9W31a9ckYj1lVyiGpySdkQ6r8V92792xMJw8WWcZ5mRJaXzkZVZMuGsenYIBM01Yi77SDcWSeqKLpHQV4kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XTtyct6Ozz9rDP77CbVuzd+IDInYzbVKu8cLy8KVnEs=;
 b=gGQM9kGJFvwIyZ9KV61+E0MqyswKg96HIsKMVhdJz3wl3Zc4Rbpw38fs3OM3dMDGsWwukYdF3pFjAnghGtDFqvAq4yyvLsQgHX1eD6t/EiKp9Mnzk4mJUUCuayS8NRFO0dD2DFnqv03nNKIFhpWI5Thr1jWeeI3kXDSdgtFao7dk0WTi6IPt9R/gsqqtWfpT/i4y2ee5W5NyAe/gzveL9t3k88OM3ZRDt/Wk9lzXcwn8Ad3BOqDQNdGjO4/+Ufg+c+1aJ/tgk5D4VWfv174AWb2NDy0zpkNDBhzzGxJkDIcb3uAfQKLV2zj/XGnhieZ6BHd8kcDBzWrsWrIrbd7qLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XTtyct6Ozz9rDP77CbVuzd+IDInYzbVKu8cLy8KVnEs=;
 b=fwcm/t4TJo8kSH1dWe4rlbx6XbvHEq8xlI8j2elCrV4JdhSHWEtIRlUjCiAyE5JIuGqVPSVUly3hu/rp209v9bz/CS5xffnSG730TCkogp3j0KJmjoCbDhhxfMQj/GqKrJ6PlC2DT4XcFhqoCct0NYJK+lQKn+Vy0llXLSDzPdY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by AM9PR04MB8209.eurprd04.prod.outlook.com (2603:10a6:20b:3e4::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.6; Tue, 13 Jan
 2026 14:17:31 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad%4]) with mapi id 15.20.9499.005; Tue, 13 Jan 2026
 14:17:31 +0000
Message-ID: <afc99365-082a-463b-8c6e-2bd3a0dda446@cherry.de>
Date: Tue, 13 Jan 2026 15:17:29 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH 27/53] ref-manual/tasks.rst: remove obsolete poky
 repo references
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20251224-remove-poky-references-v1-0-658a5f4dbde2@bootlin.com>
 <20251224-remove-poky-references-v1-27-658a5f4dbde2@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20251224-remove-poky-references-v1-27-658a5f4dbde2@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0173.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b4::20) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|AM9PR04MB8209:EE_
X-MS-Office365-Filtering-Correlation-Id: 69c23b51-07b1-41aa-364f-08de52ae7d58
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?L3ZFQ3d0cFR5WGdTd0ZWYUdIOEN5ZWdpSTNvdFBUVkRBQXlLcnlISnQxL3NL?=
 =?utf-8?B?T2pwdElrODMycUtWUGtYMFVpa0UyV0orb2J1eXRFWllzU1lac1Z5WVV2dXFQ?=
 =?utf-8?B?eURXbHVsT2NodDFFOU9wQkorMGlvclIyeXNvK3Bqdnkrd253d0IxL2xjNHF1?=
 =?utf-8?B?cno1K0dHaU5nc2NDNFpKb3ZkZjVRa3VsaUk4NjlqaTQ3cis5cmJrMVJua2Fp?=
 =?utf-8?B?VFdKSVRwZ3k2R2JJQmMvaEdEUXo1NHNWb1VzNENnaDMwa0s5bWRvQWdxVnBG?=
 =?utf-8?B?dk5zL1FNaEpvVnRhbzBMa1NVbU9nVUdrdGpOczdYMUhBbzNTTzZOSlNGNnRG?=
 =?utf-8?B?K2lnNGkzeFRwcWhsTnVneWNkbmozM1UrMGNKZHl6dHJOWGV5ck9Sa1FoTVNk?=
 =?utf-8?B?bjRleGJCR1dta0RZelRUYXVMUGtqNXFtUHJxN2grdWNoYURxa01XUEdsUmZS?=
 =?utf-8?B?QzNVbGRyZHJybjB1eEN0VkVPS0w2THVsK0ZhbXVhenpQbzlOdUpReWwvYVhO?=
 =?utf-8?B?eVRiVUtEQ3VZVzRBYUJVbjZnV2Q0UGVIU25YajlJaWxQRndoNXR1b01keXc5?=
 =?utf-8?B?aTBvT1ZuaUowMUdYQ0pTTVh3NHJXMWY1YlJ2elM4eTYvejRPWVN2WTIyT0Zy?=
 =?utf-8?B?ZTZUa2RsTmNDa3hvdnEwRlp2NTVRbUkyOWxuRFp0MVZTL2pTMDhsbkxwMWti?=
 =?utf-8?B?aU8yc1E1RFhzZ0dHVlRTTWQyU0gyS3o1MVpIam1tUlRmN0MwMjVBOTdvaGdV?=
 =?utf-8?B?OTV1R3BKZzI5Z09mbVFtWUJYeUdpaGh2UmdwcVZmUzhqOVYzcXRQYWFNWTZt?=
 =?utf-8?B?bTNiUGpIbDRKWEZWUXg1QmhMcXhMS2VHemtkczhZSENBd2tiZCsvT1J6NUpF?=
 =?utf-8?B?Y1JsRHVCVk1MakFvdWVrZ3lGNXQ3ZmZtVi9zNCs3VTByNnZGZXpTajlVOG9E?=
 =?utf-8?B?OVF6U204QnpEMVVKUlF3T0JKY2dvWFZqanVNRmZnWW1RUU0xdFRLZkdRUStG?=
 =?utf-8?B?OGl6TUFiNW5kVGFxdis4bTg4SnQyZ3FJZzArZUtsQllvVUtqR3ZKQnBKcWdX?=
 =?utf-8?B?UUZuWHhyWVdnNDllaXVTamRUZ2kvRVUrRkdvTkkwbTNlcmp3a3lycVBsSkds?=
 =?utf-8?B?bnY3UDJ5bC9admJjZ0F3NFEreThaQnlOVWFUdkk5WkdQYUNYMWtwTUtQMDMv?=
 =?utf-8?B?ckRCdVdjb2EvVDYrZWRCTEh6eEJGOTV2ZmlBRU9pdzFoWlNyKytYc0FjSTdz?=
 =?utf-8?B?OFZFQXdwV05DSG4rSVRMUThncHdvQlNVUUg0Y0syYUxTZ3ZWZTZyM2JGb1pI?=
 =?utf-8?B?ejBaUDZLNkw1NjU0bDJMNGdlcFZMS2dXM1lkTlZYUys1ZEMxWmpqbVhDU3A4?=
 =?utf-8?B?eHhXS08rMlRFNTQzR3owdklsUCtHWTQ5L0VlK3RmV3cwT0ZxNExsMSthcTgz?=
 =?utf-8?B?NkM5NjF3VTQvVTAyV0lGdXBzZFdKRXdOTkprYnJMeGFZUndVZEoxc1RzMXVN?=
 =?utf-8?B?SDkwRklSa2x6bUpRY2UzTjI2YUJjMDJ2NlJqVGsybEdPL0EyTFI1dzZieWNN?=
 =?utf-8?B?RW43N1ZJdHNtbHQxSGl3SENFVmhIUDYrbkgzKzJJTGY2Y1Fxb3lzUUlKYVpm?=
 =?utf-8?B?WFRXT2l3bUc4blUrSE9hU1k3Rk1jaC8xUmwrOHorQlcwekp1NUxMcHFjWFM3?=
 =?utf-8?B?U0FCa0lsODVPbWpoMkpESXFTZFJxWUZCWUwyV216K1pVZHVqaVVDUytSUHRl?=
 =?utf-8?B?SmN5V2VyS3F3SVhSQUpRSzdnQ0RJM0NaaC9ydnJVcndHRWVmVlhZUzZ5OXR1?=
 =?utf-8?B?bm5NUFRiaDJZM3UvTDJ3a0tXQ2luMFJqWmd1cytJbk5Ca3BaU0htWmxtQUNE?=
 =?utf-8?B?dTlWV1BSNFo2Znhyc3BENjJGcnpScElMcFlXVUVIbVNjK2NGK3dJUW90Mkxa?=
 =?utf-8?Q?O4DTvlacsXheZbbfuC/fqx0CZz/byMGv?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?S1BTVGdOc1A4cFdXdndLR2ZMbHVHTi8wL3YzS0lNRVZqQkk1N0htRnMvRkhB?=
 =?utf-8?B?YXVmeWwxODBYemRSM1hQTkZmWjhaMFdaVFZGa1NaTExPblVkZnJSazYwdGhy?=
 =?utf-8?B?Q2JVTWdhaG12Qlh0Mkl2ZzdBdHBRbTlKZ2JubXFJYU80TEhPeE5ReXlLKzF0?=
 =?utf-8?B?UVZCWm9lVmpSMTN6TlVTcVpEcDRqblVyc3IyRHJtWEVINndFY0ROTXVvY25j?=
 =?utf-8?B?eTdaZlFwakJPUzMvWGVMYjRTRXZsNXpWY2FqTmJCMGNEQngrSnFiK0N1VGJx?=
 =?utf-8?B?WVYwT015YllDME93VVNMVE01WnNWT3JWMzB1WEhQSE05THRRWHpmaGNBejhB?=
 =?utf-8?B?akFzYUdiUk1wUlcxMDFVeVczK2FOS3FPMTZ2YWx0TW4xakVNYmdieHBhMGdj?=
 =?utf-8?B?dTZIQTQzd1ZJdTFlL0pibGx5enJVMWNxcGhZTXBsREFPSklZTHZsb3NNdDNH?=
 =?utf-8?B?Uy8wVm0vM0NrN2FsbEd1VmJhc1Buenk5NlU2WXhqRnZTWFdCcVB4eEpvOXdm?=
 =?utf-8?B?OVN5MlphVEVaa05EcThhVXFyaU01YUV2aVFUMWZoTUdodytVN1dlTTBRNDFu?=
 =?utf-8?B?RmVUNmI0OFBwS2JhZEgvRlJDeUdWTDFhQ3pZZ2FnZ21oV0FleGtpem1CQlZL?=
 =?utf-8?B?NlE1a2ZvQnhDbVRWV2lPQ2k0dG96aXduV2VDSGI0OTNrMHUyU3AzcHNpSlV5?=
 =?utf-8?B?RFpiRHlLL3lGZDQwZ1BSUnhiODVNVmRkQkh1YkRHQWJVcDMvN0ZkMkx1T3Q4?=
 =?utf-8?B?WTJUSWQ5Q0k2Y28zR0NnOWpCNDY3ZElEVXFmSFBwd003NnJOcFh0OE51blRY?=
 =?utf-8?B?UkJLRU5JYmhaa2ZHVEliSkFwRW9KZUFjaDg3NlIrVTdZb0xadWlGTm9aTlRk?=
 =?utf-8?B?UHkyaUxVSUFOd1Z4aEt5UVhmbVlNY09qcDdjK0l0YU1aUFcrbUlMa3pvM01l?=
 =?utf-8?B?WWlDcWFkYk0xYi9QWVUxQlhzTSt3UVV6bVZWQ0V2RDFBY1JPSjYrMlhCWE5t?=
 =?utf-8?B?RFJkNUdrOGJNTU1ybmRaLzV0ZzhzdEpDYSt3TlB1citwbGhHVlVqU1hXME9U?=
 =?utf-8?B?SXg4ZkQ2Z08wcXZ5bEI3dzVNR3A5R3QwRlJGVXlDSTY5SUhVbGxZdXZPek54?=
 =?utf-8?B?VEM3RGVCbmpZTFlUaFdGa0xGc0E1M2ZOcUhMWkN5SUttZHhIZTJRSEhWZjBu?=
 =?utf-8?B?MGZzRVBRRzBkZlZsMzg0T1RSQjJRTHdXcDNibTdnM1c2S0UvMmFsVTdDM2Yz?=
 =?utf-8?B?WERqU0hrREwrRVppMUdOYnlVeHhRUEVJSkw2azNabFhuck9zN1hvZytjWjZn?=
 =?utf-8?B?aENxT0grZHFUeGtOWXBHTjZvYXBLOFc3RlY1MWJWaUFrR0N2cnJodXM5Ri9h?=
 =?utf-8?B?Z3FJbVBnTFh0MUVMazBxRkpWc3g5MXA2c0ZpVkhxYzlxa1BGUWROMlVnMnFh?=
 =?utf-8?B?WmQ2NldxOUNvb3E1RDRWb3FEUm9DcXJnKzFKVXdubmJ1K2VOQXFrQU9Qd0VL?=
 =?utf-8?B?Vm5aM2dodUt1VURCcmEvM1RBYXprci9zWm5mTjlZbXQrbldWa1g3bWF3RitG?=
 =?utf-8?B?Q3E3ekN2bnBlUzN2MkpaUVRlMUszbDVpVEJaaVhXZFlHTERmME5kMUI1NFBM?=
 =?utf-8?B?NFdncGlYRWhyenJyZ0lnUUVhVGxWZ0hVaXBCcVcxZythWlFkZW9Zb3g1eW12?=
 =?utf-8?B?RjMyOEhkeWcwM0g0TTlVSS9ZK0tvUXBjaHpoellKY0o3TDk5aCtUWmFYc1Aw?=
 =?utf-8?B?Y2tRU1JvTUVnZk9rcHNTclRBb1IwTDhrUE5VL004Skw1N3QzK0tiWDdMdXRH?=
 =?utf-8?B?cSs5ZC84Wnp0bnlaZG5DTmJLZjlaN3V4b0hHR2pSNUdKVFpKZk5EZ3pUUGJU?=
 =?utf-8?B?L0o3ejBkaWdKQ2pSMUdHM0pRZmdtcU56S2txR296OU5TVFFkK0lLL2k4Z2pH?=
 =?utf-8?B?SlFDdEZXQnpaUlI3Nk0zOGdvaU9ySEx1L0VqY3VmTVVmTGZ4dk1WMFhaamJi?=
 =?utf-8?B?L3dvTDRLOWZBRC9RTlI5dVhzYy9LVXZERWJjRGZlTzZaVld2N3ZyOW54L04r?=
 =?utf-8?B?T1BqOTN0MDJpNG5nNjZBWUpGamZwTVZwazlEaTFQV1ZjSXRWTit2d0ZNT2gv?=
 =?utf-8?B?anlTbmJPWklDOVpEMXdhM1JJdVdLQ0hBc1JKYnBsWVNYL0p6SExaS2VRUzFG?=
 =?utf-8?B?VnNKK3d2czJpVm94dUlzTDcxeGRIR0p5Z2V0TmtMUi9NOSs4MWdPQkl3V3o0?=
 =?utf-8?B?MldZRWFSRmNSc0JuOXM0QkV3TmNEbTREWDFVbFl3Q0FWcm95emp1dDRFbE9W?=
 =?utf-8?B?ZTYvcVgrc3llQVlqOG1ZOHFZNjBldkFJNDBjQyt0RG1WRzFIWHNxQT09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 69c23b51-07b1-41aa-364f-08de52ae7d58
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 14:17:31.5188
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cldv3c5gdOkmVnjihsdtRld4uceS5mN63k8w+2kB0KfDZ6eNSITyllC7nT9795UVh3k5tHi5qzx1S9nrsVRbsijsrTDpfOoEIc5xtReKQYE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8209
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 13 Jan 2026 14:17:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8516

Hi Antonin,

On 12/24/25 5:31 PM, Antonin Godard via lists.yoctoproject.org wrote:
> Remove references to the Poky repository, replace by OpenEmbedded-Core.
> 

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

