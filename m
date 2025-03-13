Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DAA6C282DE
	for <webhook@archiver.kernel.org>; Thu, 13 Mar 2025 09:41:59 +0000 (UTC)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (EUR02-AM0-obe.outbound.protection.outlook.com [40.107.247.83])
 by mx.groups.io with SMTP id smtpd.web11.10469.1741858912707962987
 for <docs@lists.yoctoproject.org>;
 Thu, 13 Mar 2025 02:41:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=Av0xOQch;
 spf=pass (domain: cherry.de, ip: 40.107.247.83, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d3lMpxYnTe6GbQz9RSZQ903KQtPn92oMIU1noHDQz9IoqsDdaMUnjT357GA2BrNmJ1uhVmWN5o9VVDEO4UDAyQAAMvKaRsup+Ar5GjxDretCF7Fuew02vCgS9m3I81iYKopI6jYohB15pV2sCIqP5HcuKhBel0/yAPdJ2eCwCQkG9i0AaEE+FJDm9OF9lD/Zj4TWQ8oFyQqjkXSqU89L2hMsvUVShUHPu86FzngOO+xeMvgoT2zsJJqLKbhNJOlhYe8o6X8BuSTYe5VDJwFUwDyaipyyJlaHLDQvpTbattimDWMTKeoGXtVxNSN/zR9TzLbfHY7JEbtjzK/lUWaQUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9PP3t3Xc2OfV7a0SOverN5gRKkid9l76X1Mc9T3PhHc=;
 b=S3DcXugAitHyCZacTLQXuJwCMxlXuCRDFwpq7LEzvoKzhwOtXPwbQOlasq/V5SHYC1QmLxCv+CwpZMUqSsP03grSGyfsiUWm7wMxPhEb4Mjno1TYVe6yZhGNrjYVR6pzPSdyGTj02g4dnzG+xZWNbOthtWd/JiQgx5mP8OZx6EcxD+9rq6de7gCJjXWJlBMhZHjs2AklbbYHTwvW8LwwkyTmR8nXZ+kaggJTMgVrTqQonNsR1bGlW9O56YBS/5uCmchzfmnUSZIAzD9xpE68TNZ/xIBZmUBSdML53fdg4jAfQdp+VvYQm2cfJWnLfuSZJy3fCEo/a+rrgfwX0SXIfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9PP3t3Xc2OfV7a0SOverN5gRKkid9l76X1Mc9T3PhHc=;
 b=Av0xOQchfY+30yXrBx4d4hJaBLzxg2DGzuZ5mOrTpt+2QsG346lIGS4jmXihBeqjcnPKKeP/9eD6Ntb74Ziv68urdQvuiI9N7g+DCr2WpC8GFEeW63XcEK/+nz8xNaEJ4wv000l0uwQn/AEy589it1Uek048O7bipeo98lFAAmY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AM9PR04MB8906.eurprd04.prod.outlook.com (2603:10a6:20b:409::9)
 by GVXPR04MB9901.eurprd04.prod.outlook.com (2603:10a6:150:113::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.27; Thu, 13 Mar
 2025 09:41:46 +0000
Received: from AM9PR04MB8906.eurprd04.prod.outlook.com
 ([fe80::d379:5378:b1:cea]) by AM9PR04MB8906.eurprd04.prod.outlook.com
 ([fe80::d379:5378:b1:cea%3]) with mapi id 15.20.8534.027; Thu, 13 Mar 2025
 09:41:46 +0000
Message-ID: <870b9cdb-32a9-4a89-b222-7a987b6c5eea@cherry.de>
Date: Thu, 13 Mar 2025 10:41:45 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH] dev-manual: remove qemu machine name list in
 runqemu invocation
To: ross.burton@arm.com, docs@lists.yoctoproject.org
References: <20250311123025.1915242-1-ross.burton@arm.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20250311123025.1915242-1-ross.burton@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0225.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ac::13) To AM9PR04MB8906.eurprd04.prod.outlook.com
 (2603:10a6:20b:409::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8906:EE_|GVXPR04MB9901:EE_
X-MS-Office365-Filtering-Correlation-Id: 8df1b2c5-fee0-45dd-b95c-08dd6213452a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?amhhRDZKT21DOVd6eWVETW10d1lYWGRaOEhpSm5FU1VlTStEMDVEalNnSlVY?=
 =?utf-8?B?ZU11cGV3aXNDWDBFTTRGTHAxWS9KMGw1SU5ibER1Vk9Xcm1NODd5VHB6cUlV?=
 =?utf-8?B?Qk9BNVpuYjByMU1BeHpaMEFWWGd0NDdtRlg2K3BrR2MwYTJ4V2NVT2N2WE5I?=
 =?utf-8?B?SktoY1VjM3o4b1luRmlXb3VOSlBBMUZ0b1ZpRHhzVmFwdzFtL3Yxd2pQK0dz?=
 =?utf-8?B?OVRLeU1oaGdTcnVLVHVhS2lxcTZBMHorNVZoZldSUnFZU1NiWVNkNHV5bW0v?=
 =?utf-8?B?cVN1L1BXMlJwT2k3eGRLMGpNUDlIUUh5RzBKUzUraFRoSGU3WGl6MkhpRys0?=
 =?utf-8?B?L3lCUEZEVFdUdUFyQXJ3Q29obmxnR3ZIRThRYUtGRXRoVVFEL016Q2FOSS9R?=
 =?utf-8?B?YmZFd0d0NG1VcnZKVHVvVHZUUU9OQ3d5cW1QOERqZ1h2ek9PWS9oZm9hQ2RK?=
 =?utf-8?B?cTVIN3lSQzRBbHhJWlBUNnNoZHAxK29xVUNkdnhEZ3lCWktGVkhnc1dkNHBr?=
 =?utf-8?B?cWl1L2JRTTJjSXF2ZitKZi8yUGlVcGdVaUVIcmF0Q25abkhQM0RXdEZ0Qm5T?=
 =?utf-8?B?N1dYL1dNdVFXU1R6UEVERVpRNmNPUmlvNjM4VDU1aUZyV1dpUC9IREhjRWh2?=
 =?utf-8?B?OExVbDNWR3k5cGtUSm13UGhGMTlCdkNpMFBMY2NTYUJUYVNHODZCYXZBdnJZ?=
 =?utf-8?B?Rmx6Q3NLRzViam5oUlNGQ3o4RG5VOEFTRjBpc0R0dy9IZURsMUZuVkFkRE55?=
 =?utf-8?B?THRYNU9wRFI1TlBadUZERG5OaGtwL2RlTmxRbEJ6S0lBTFFkdDR3dmNvelJj?=
 =?utf-8?B?VEJMWERhYzFJeWxaQkhqelo0ZnFtb3Y2aVNLS2d3R2d4RUM0MytIQ1ZFSGNJ?=
 =?utf-8?B?ZHc2Q2ZIb0pzNDhsR0FkQUxwT0kvbXZkb1dhQ1UwL09WaWNRMm9vb0Jlb1Y1?=
 =?utf-8?B?eVVoMDExSGZ5dWNKRnV4TytrQkdMSWVMdjEveHdMYXcvT1UzUmdoYUxYaGF6?=
 =?utf-8?B?MnRpZXh6dGhTMVE3L2p2NFducFFmQmEwc2xPOG85RDQ1OG1NSzY2NFhiSm1k?=
 =?utf-8?B?ZU9tL1UrNFZ6bW1BQzZtazJsT05GaitWdHB5UysxSVFtMHZLYmp3MWNIRHpP?=
 =?utf-8?B?N2hkNUhMMUd2Sm5kVHk2c3BCWnZvNy96dmhRd0tZbldBRGE5cjV3WVFLc3Jj?=
 =?utf-8?B?RzlFNUxQSzQ0ZXpmdHd3Q1p2enduM003Mi96cGVjU2ZWSjJkaEJzcmpkcm9l?=
 =?utf-8?B?d0cwbk94ZTYzSHNSTndBN0RNb1lKWTRuR3h6dVVmV3FHbGVLbjZjbVhRT3dK?=
 =?utf-8?B?Y2dpeVBCbVNwMTA0aGVRemxlRlQ3bXBPc3lLQzFrUzk4L0lIZTdCSng1VWZh?=
 =?utf-8?B?YkdFbDVHeVJHMWdxeEVpdEEvVGVnNjFKVnVyMkcxS1N4WExDdmVlVUY3bkNn?=
 =?utf-8?B?R3YySFFSUW1NVkMxUHEwODljdkl3RE9WTGwyd1BwRm5ZR0xMWTd4WnJDY1B1?=
 =?utf-8?B?eSszb0NQT0Q0WlZiTUdJNiswYzlvQVpQQTlldnBMRnRYNzU1cjVUZGZST3o1?=
 =?utf-8?B?QzR4bDMxQlJGYndWcHh2VGd4WFhmdEJhNDh4OXN3VVc5YjlSbEEyaEhBMUcr?=
 =?utf-8?B?L1hCTFVWOTl5OXUwK0dFeURFcFhlRk4wRG5FNWpqS2tNZXdQOFZEditocUZQ?=
 =?utf-8?B?RzZjNWxPT3RoZnpBU1lPT3NJYk9GSWtvSTZ2Ukw5bnZNUXI1UE1LdzhEc3pq?=
 =?utf-8?B?STR5S1BBbXg0bnkyb1krK2xDRGhaT3Noa3JzSk1CcE1leTlhQ2hxcjVOeDYr?=
 =?utf-8?B?aGNCZlhqaDZDY0xtQUoyNm9pUXJMWWppdUl1WFQxeDJKRXlXeHNvamhUWTg3?=
 =?utf-8?Q?5zRz4AFnli7FT?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8906.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?bDd5Y3RmS3ZycGxUVWkxSEFLczBGZmdveTE0bTcrem42djFVVUNWVVJOVUxR?=
 =?utf-8?B?TFdueDNpNmFLZEQrdkhjRkV2S09ZN1BTaE5TaEpMUSs1cXd4N1J6cEV4aDZT?=
 =?utf-8?B?cVJFWEdnN3Z1dUJkOGo1Y1dIOXM4YjNiQkh0ODN6NFNYNEliL0pqZ1FybTNC?=
 =?utf-8?B?Tm9WUDZQUDkxclNyTENzNmV4NkhwbWtYdHp0QmprL014d0pkR3RXWThXalJ2?=
 =?utf-8?B?Vi8wdVNrYXJZTTlKd2FCL3R1L1BnV3hsSWVBMGt3c1dUR2FtL0taeklnRmxt?=
 =?utf-8?B?dVRnK2pDM2c1OHd0UEE1aHNrOHRBTjB3OUNZY21ibkYvd21NSlA3ZDhNZmFz?=
 =?utf-8?B?S0h4d0hLNDBTaHd4aDVOYmwxMW95VktoaUdJNDhOQmlaVWtnWGlPSGhxK25X?=
 =?utf-8?B?YzNKTklOODhVS1liTzl0MTdkZEpMNmIvUEhzMjUxeG5MeVhWWDVVVDNOd3k1?=
 =?utf-8?B?RGk0cE5Ea1J2U1hid1gvYXdyeFM3YWFmNUxxUy9EYzNkc3U4cG92a3FHa0Zy?=
 =?utf-8?B?T3ltSVhDQ2dNRloxVHlOaEdVSWdEZ080QlV2alJobUlsTlZXWCtydGFRdFZW?=
 =?utf-8?B?NzhlSmwrNmNGdEZxVlBKRE1hbjY2dkljVW1QeEFXUGF3aFk0TW1YZlpWRk9j?=
 =?utf-8?B?M09QSmRoVXR1S1VvS1hMWS9FYjJjNWlpMFlFTzRkTmRoRStnQ0pwRGJ6N0gr?=
 =?utf-8?B?cXFraXJaRVk0eDlsSDVTcWdVdzdrc244aDF5dlp4c3JCbFRQSmZJd0p6dVgx?=
 =?utf-8?B?bWVIckxLZlM4aGNVRXRCUHNmMTZyYVprdkR1Wis5L2hDT0RQMFY0TmUvRzdD?=
 =?utf-8?B?eTBYZDdyb1VGNTNkU1lEQjBCMmFOc1hXNndOUjNuaHNnOVp2STNXdG1oTWdG?=
 =?utf-8?B?WTdIZmZMYWZFN3lZd0hrOVUxNjhkUjB6bTBBT2NOdk1aMmhRSmJJVzcrd0tx?=
 =?utf-8?B?N2Z5eE1YejMvQUkvVnNaNXIyaktrYlZNcGtqM1l1cmp0OFcwYmJRSW1mN0FC?=
 =?utf-8?B?S1BMVllId0NTa3M0dkpGa1FnbVAvRnQ2ZTE4cDRERFFBM2VlbmNLYndnZ1dJ?=
 =?utf-8?B?T1lUK2xWQitka2RjWFZ3bkhGZUZraWpZUUpGYTA2OXJFVVNuOTNFL0tEMWlU?=
 =?utf-8?B?TGp1UEo0QmhndnNvTVoyaEF5NmdmRTlSZnVMampSdEo2YWxHUDQzdWxVYU5K?=
 =?utf-8?B?NGFSRFY0MWwwOTZpbEtPY0M3TG5QTWZyMzBQcU9yQmZjeGtSL2FHRVFvMjZv?=
 =?utf-8?B?R2k4bGVDaWhoejdkYzFkcGtTUlZKeEc4WnczZkVTUnBZWjZ3dFJ3ZUU3WWpN?=
 =?utf-8?B?dGw3Vkl5Mnk0UUEwTFUzL0hVWjdyTFNCQnNWMDNEc3U1dHFvQVh5UVVjb250?=
 =?utf-8?B?ZTJ6Y2p2ZllobGR3TTIrZ2I5RzJpQ1lQR1ozeVBFcy9zbzF1OHloTnNDMzBa?=
 =?utf-8?B?K283dXB2cERabFFxSVhpWktxekNDanRKZTJTRUIxMFRLdWlrYWovVkNmSDVU?=
 =?utf-8?B?aGVSRk5YekFUQ0ZXVVFONDBldjdxRWtodEw5R3pHQjRwSXRZVDh4bU0yeHRz?=
 =?utf-8?B?Z1J6K1ZTajBqK2IrbkY3RDJUSzNCMCs2UHZuWCtoUjJ5c3BZbUpBOVg0dFUv?=
 =?utf-8?B?b3p2YXVDdkVEbWFZcVZvOVNYbXhiajJ3akxEV3hoK3J1bkg4eXNSOVR4TG80?=
 =?utf-8?B?a1UyNGpicUpvZjB4d1RyaldDZ3lYYThNS1RMSXdpM1dPc3NpbWZHODNuNW5x?=
 =?utf-8?B?UHM0dGFmcjZic0haREw2L3JUdDRudXhEYlNmdDBaQnl5UitreEtQRnpUWFF1?=
 =?utf-8?B?TnV3VU1OUm1TUElRMGhJdzBUZW8wUXplQ0FJS2RIWTlzeEhNTUlCN3Z5a2U1?=
 =?utf-8?B?TDg2ZEx1RUdrd1VGM3JtUm9zMnFKdFk2UTk2d3AwOE9RNmtMdzFDUmg1Ukcw?=
 =?utf-8?B?b2N4RSt2cnQvZmxONHF3bFhabUVsRkUxVGVaaHNQYktKVGVha2Zlb2tqSll5?=
 =?utf-8?B?RUZMRXZxc0owQTRXZmpWeE5jOXM3RU5MalhpNlBJVE0yT3JEZEtCZU42cUVD?=
 =?utf-8?B?dmN5WVpDN3hzNDd6RzVzR0xXdlNQTXFHSVRSTmRjWUpBZGxFQUx1MnAwYy9N?=
 =?utf-8?B?R2RFQWxjdFBkUmQwM0lneUw5WllwVHBJZkZBTHlrNnZaamhJNi9pRkpRZXBu?=
 =?utf-8?B?TkE9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 8df1b2c5-fee0-45dd-b95c-08dd6213452a
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8906.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2025 09:41:46.2134
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lL7YUyjBwI+ycCbdn9adUR0CarmC1jMkPWHphEN/j3pTETtX0BmyIKd21bD1UaWE7fCWzuIJAdb38nyZhlxkJb9W3RELqHLLvLgftJrebks=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB9901
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 13 Mar 2025 09:41:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6554

Hi Ross,

On 3/11/25 1:30 PM, Ross Burton via lists.yoctoproject.org wrote:
> This list of "valid" qemu machine names is obsolete and incorrect, so
> just remove it as it serves no real purpose.
> 

Do you have information if this was true at some point and when it 
stopped being true? This would help to know to which release(s) to 
backport this?

Cheers,
Quentin

