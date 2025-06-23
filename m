Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E97FC77B7F
	for <webhook@archiver.kernel.org>; Mon, 23 Jun 2025 14:12:50 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.59])
 by mx.groups.io with SMTP id smtpd.web11.20824.1750687963659817640
 for <docs@lists.yoctoproject.org>;
 Mon, 23 Jun 2025 07:12:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=RqmvIg3F;
 spf=pass (domain: cherry.de, ip: 52.101.84.59, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GnnhTJZT6JybyzzQMOBXAC/e+nazQF3PdKkLA3aRlAcbm+PMi4nWwmg+bFitUJhuyO+YUlyOMT3q4vY+CmJBoYFawVqkaMV1kzwwy2rHhb4Ud/ntSOD+Qs1TkSCUO+k9SbiZqEocR5vgnZId/tmBbqM+tf1l92JArUlsCIxxNQlyepduBZ8y0OnmSKSGABQdtQLSbpWC6e2zLgd4RU6jonohG/kYyD1sZMcPfdecj3Txz5FMRIpBn76GDfH6bS5jDJYpD5U6pkhdrF4H9pse2KWf6swCd7HKBqpMvvqOhw8Nbsu4KBdMhLOohtcpN1AWZqsbKsGA/sUCmLfL6luqRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TXMlFDqhuppUjXrDn5FJMRENf0x8fz12abV58YQTp7g=;
 b=Xm4/RGK9slB/Mu9OosgXOjeTFHlh9CTwMsZGzlI1JSB42miNKXlPkn8e4hH9ia6svEGA+u/xyMbJ1MTg9RmqWAIiWtY0EHsLjCw1y9JZm2Z5VWIpbq8BEafNLmbSr09E5y25oogcyedkjFkb/h5NEiYhpGkRaU32kv5giasvfZjyNqHvdmXH6F/hsnMLALQ3lAuO9qaj3038WFZ1WSSN7v8A6neQLDHkLBzhD5fRjjEahVRsbDVYr2mqCfIMsXbYQhFuXLeIIccmUquq6dMPJmEx/huB22rm50TpypLanXXc6u4c2iAFwHR2eQXJtywKOSg7ht6mJ1oymcEttpI7gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TXMlFDqhuppUjXrDn5FJMRENf0x8fz12abV58YQTp7g=;
 b=RqmvIg3F5VG+cCrvkaF1msTZs1o4+iz7mRGMTxb92gczXcnWzE788UVWISGRo2AjpJEvUJm9yAXeiPk4AUa8Qb5NURSO0SwxUdXElEH5XG1VME7ruOLsPA0n7qR1ZhldEyWc9oyJqhk+o+qs627zYcuejyrCVZIy6OeiemVctyo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by VI1PR04MB6863.eurprd04.prod.outlook.com (2603:10a6:803:12f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.29; Mon, 23 Jun
 2025 14:12:39 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1%6]) with mapi id 15.20.8857.026; Mon, 23 Jun 2025
 14:12:39 +0000
Message-ID: <755bb980-3619-4b67-be09-2a77bdfd1ff4@cherry.de>
Date: Mon, 23 Jun 2025 16:12:38 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH] dev-manual: minor grammar correction
To: rpjday@crashcourse.ca, YP docs mailing list <docs@lists.yoctoproject.org>
References: <47e13a94-0ba3-cd70-4086-897143f7ff61@crashcourse.ca>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <47e13a94-0ba3-cd70-4086-897143f7ff61@crashcourse.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0360.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f4::13) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|VI1PR04MB6863:EE_
X-MS-Office365-Filtering-Correlation-Id: 957f2d3e-4929-4f21-8e15-08ddb26002c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?OHAyUHdlZk1tNmNZRWJtd0tnNmJ1SERBNlUrdmlUNEZidmdOVkN4WG1lNkxx?=
 =?utf-8?B?b3RPMy80VEU1WG9LZGFralFZZ1NCQWZMczJGZkNJUWxpTTAwNTZIWEg1clBm?=
 =?utf-8?B?V1VPa0dRMXR0MHprKzRQY2Z0RFIyVXYvN1RuYlNudk03NW1LN3h2OGZPZUFH?=
 =?utf-8?B?UEszd0ZrbTVRY0FHb3pFbkV5WldGdExKa3ZrOWUwdkdaOVBGbzAyUVRKL3Iz?=
 =?utf-8?B?dHp6c3hOUHBublE0YnJFV1R3ZmtpM3R6TmlnL2gvckY1NzFmNUV4azRJdkRN?=
 =?utf-8?B?ZTYyMmR3QTRNWndBRExLVS9xckxUQVZzSUljWVNMbWJTZWhEU29BNTcxY2Yr?=
 =?utf-8?B?bzRVS2UrU1k2bGVBVjBub2ZYaU05eDI0RVVZOXpobkU3OWtucy82RitmcjIw?=
 =?utf-8?B?OEtRQ0xmaDBlKzI0TGtBYnRDVFo3cDRmVDI0K1FVZWlKYmtIQ1JRMEN2RkFH?=
 =?utf-8?B?M2phWVVrNW10UHIrMmt1TlorMUt3Y3B6YUpqNm5KRlc0N0ZjdTU3NFg5MGVN?=
 =?utf-8?B?cjNLQ0JPMmt3SE1Ldyt3MzJkcTZjT2dwZ1NCMVNMQUpVT2VMSGRmRzVTbE1Q?=
 =?utf-8?B?YnhpQ1FKQjNsb3ZYLzVqV1dnM2x2QVQ2NGdoWURHRUdVYUJGVVlCSndSM1U3?=
 =?utf-8?B?WEVBTCs3QzkveE9XalNhWnhMejZLZ3dCeDVOOEJtLzZVbDNsTEpxb096dHd2?=
 =?utf-8?B?K0tCSWt3SDdKeDd4aGNkcnBJcGdYU25abUlHOE5yZDBmTzBtN2pqV2JCMm1o?=
 =?utf-8?B?cm1DQ1gyRjZ4Kzd1MWhaUkNVVFZCV1FPb256VDV4R0tOTjV5bjNLaDFKQ00w?=
 =?utf-8?B?dXpTMEhiZEE4ZU1RRjlzMXhhb1ZIeWlKMlM3Y2gyUE16L3hRekpDaFNUc2JY?=
 =?utf-8?B?bVV6OGlKOGEyeERaZHplSFNsQU5DS29wdUxoQVAwYWd3b0s4bC90WFJWREQ1?=
 =?utf-8?B?SG8vRTBuRVdlaWF0SktEWmJLaWRabXhmbmVGTzVQcXBYOW1FSmhBL0pMeVpv?=
 =?utf-8?B?YlNLbGZKQXJkNk1RQ2NKVkNDWHhTL2RXanZwVDVSZ1hBR1BBbDNSeFJpZjdH?=
 =?utf-8?B?Z3NYVnZFT3hzM0h1K1I0SzNHemZLVW5ReVRKUkZwYTJOMm5EZU80R3BqakxW?=
 =?utf-8?B?Znc5TExIc0RRd0s0Rm1KcTMxUktJcUpTcmlsdHZiTnlMSVR6QURNVUoyQmlW?=
 =?utf-8?B?d1EwNUFKbVZYdXNkTHZIM1FnUFdENURybE02OG9pMW84a0VxczJyWVkxYWRF?=
 =?utf-8?B?UVd3Q2NBZkhLZjNzQUE4bytOY0w5QW1OdnhxOThtVHhSZnRCMkpmRE95ZTkz?=
 =?utf-8?B?RUNBNW9JcGJWdU93S0hKMW5aN3hWd09Cb3VqT0lvcUtWZU9PRTYzMzZ2R3NL?=
 =?utf-8?B?My9TR21WV3Y3bXFnbFhPdi9LZFRJS1ZqSG95YlFvUzhaU0xJSTdTZEJLWWVs?=
 =?utf-8?B?dHoyQWllRERSeTNOVU1ZSzVEM3JYcUNYNE01RTFlOG96bG9zcGtvYVFFSnIv?=
 =?utf-8?B?eGZJSWxFRERRdFNOd1JodHpHUW5LQ0s0ZWt5OVYvNTA2R0Q2K0U1d1Nad2lV?=
 =?utf-8?B?SHI5Vm0wdEJVUmVpMXBsMmMvQStFV0xzUlQ3Q0xCcmRnZXk5SGlIZ2U2OHlS?=
 =?utf-8?B?bTUvN2djMTluM0JIYzMwU0VwVE5XbVQ4QXY1OVlaVXNmUTVseVp5ZjFuNXdQ?=
 =?utf-8?B?Y1R5SHl0RW1oZHUvaFhuNkE4LzRxVW43ZkhrZ0ZoNisxWXA1YlFRNk5mYXVj?=
 =?utf-8?B?T1FHNHFvK1MzOWIwNTBpQXZpYjRrYkYrSWtGRFN2ZENOMmxORnZUL2FvdnJ5?=
 =?utf-8?B?MDBZSzdyc1c2ajkya0xENExpKy85K09oSytGU3JJdGFpMEd2R2lEcWxhcU1P?=
 =?utf-8?B?OXdneWw2dS95bGF0bGtkNHQ4ZWJmT0dlSDJqNlRBeWxMdjR5bEFYcmtXUWo4?=
 =?utf-8?Q?T1ROB6Ijuw0=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?NmpIYXlGK1F2M1FxbUtoWllMcC9BOEcxVHhRL0NtbHp1N0xmNTlGczMyV1Rs?=
 =?utf-8?B?QXhoUHFPNFlNZ1JWRUFrUjRZVTlVcTRlOW0xTkNneWE0UFdBbkRVZlhydExI?=
 =?utf-8?B?ckFVelhRcHlRU3dpekgzK3pyakxtckxLdzI5K3BnU2dTbmQ0bFhXWTdPYUVU?=
 =?utf-8?B?Y0VZeW0rRDR1N0FoVEZKNGFUNTJkQWpSUnRKZkZWUzhQTGVzaGFiTVg4Qklw?=
 =?utf-8?B?MnJDdzg5UDRWRWt6YSt6ZWhpbTNCL0k5WVQzbHB5MWVPZlhJVzA3NnZaSnhK?=
 =?utf-8?B?V1A3OFloL3puZHF4dXd2L0RUV3FVNkF4YjExa1BzQ1libS9VUTJ6VHlycEtJ?=
 =?utf-8?B?dUtscVJYRlhpVW9uMTRUTWVTQ0pDSG5jOTRZQXV4bm9tdS9WaU9Hb0xUVlRX?=
 =?utf-8?B?MXV2OGxBY2hTcElvbUZ2MGhXRWVNUE5GNDM2WG1KeDlsWjVBaVBBZnQ4RWIx?=
 =?utf-8?B?Wnp2THFpcEJyQjIxWmtXajl0ZVRWMWQrK0Nmb2dvQjVWMzdBSEhmOXdIeVpl?=
 =?utf-8?B?K2VmL1ZKaHo1R3Z3eGRlL2NqTStIV0RwbWZjMVZ3L2hwTjBSZnNOc1FTSHpE?=
 =?utf-8?B?NnpySFl4VXVORU81a1gwdFhrbnlYbGVFT0NjTTFtM2tGcGVHWE1RZWVFK29u?=
 =?utf-8?B?V2J4KzlYMVJ2QnBaL0c1RTB2cDJpWFZsRW9iYUp6dWw4c0w5RElyUElsc2ln?=
 =?utf-8?B?VmVsQVFKZlQxL095WkZUbll5d2ZYYzJLQ2QxQXZDNFFuVnlKbVhGQW4wOWZ6?=
 =?utf-8?B?VUJxMGl1U1V4QVJiTnQ2ckV3L3R0YW5Cc2ZPYy9PaFgyTHYvOXI1V1lJWmUw?=
 =?utf-8?B?dENTdTdqbmNiU1o4VTlHZysrT24rcUgrOEM0Z1ZPYjc5cEh5ZlRVSnZiSjJj?=
 =?utf-8?B?dlJVYmFsSDZKWUYxT0pQRG9PNDJnWEtrdFlYNW12U3FyaHl3VG5XNlZqdUFE?=
 =?utf-8?B?VjVjZVNFT0dZUGtJLzdDYkIzQUp0ZFdmd05hckc2L1Fuam5pS21lR0NCWWJX?=
 =?utf-8?B?TjNUckI0eGEzb3llWDcxUzdMaGNKR25kdVpMYnUzMlFLTXJudmU5UFpSbWlt?=
 =?utf-8?B?UzgwbW9Pb3BvVm1MOTBYT05ScTR6SVd4ZFVkcnp1SnZTM3lqYnJzT0VKdC95?=
 =?utf-8?B?K1E3NE1EZkVIdExNOEJTZEtlS0hwbityK0g3MUVnZit1cGlWWGF4VjlWSkJD?=
 =?utf-8?B?MGMwNm5wbURCZUJWTXJlemVVcGU0S05OMXJjZVhPWVVXak90RzNwczF3RzM1?=
 =?utf-8?B?ZnBEeFhQOHg4T2dWNDdsZXFGMk9wZkVBL1dsOUlXa0NuY0dUSjZqNXJLK2Iy?=
 =?utf-8?B?c2tkSk9ZMk14bE40VDFOT2VpTFdPWmZzeWtvVm55QUp4Q29qR3VnVC9xbWRu?=
 =?utf-8?B?WUQ2bzBCTnpQOWhsTnpzNmFCSVNyYkFOSGVhSEkzVjJaVTUrRCtQMWJyK1R4?=
 =?utf-8?B?WmhDTE5UdGhVYzdYSldrSmRvTUNjYTBKZmVoZnpmVEpEQzk1SHdPOHl4MC8x?=
 =?utf-8?B?NlM3cWFUQ0dvTUJpTndEbGpXWXhteGRNTFdGK1Y2TXRNZGJDYnFtUlZrSWF5?=
 =?utf-8?B?YVRWVjR4bC9tT3RLcHJiTnFScFh1Umc2T2FSM3RuWnE3TGE0LzVibWF3eXNI?=
 =?utf-8?B?S0JQSDBmU0VOZGRrQU1xYWJPNDlwS1AvWUhQd2Z6b0hmVDMwQXMzbldEV0lG?=
 =?utf-8?B?em5oS2NOM2JDSm90VVEzYjFPbFBoZlUwTjYzYVJ3N2VYZE5CS0JoK2poQnRk?=
 =?utf-8?B?THF3WktmeFdRYTJxQlpZOTF2ajcrYUk3MThzS1hISUFla01sdDkrdU1SNUFp?=
 =?utf-8?B?ZG4yQUlNYllhcEp2SHBxRDBZWWQ4dmNaL2w1MlRaNFA3eW9CQ2hKdTdUNU9o?=
 =?utf-8?B?ektvaXFySWdpSUNSL0ZwbmcvMnd5WGVpMncrU2dPQUIrSWZRUFhBUDZhS1Z5?=
 =?utf-8?B?RHY3akFRekFQaGNCOWdKOWJUT2lWbURDYW9obFlNanJ1SHRSeUpFRTZJeWxw?=
 =?utf-8?B?Vk8zV24vbjU0dlAvUWZhbVZSS0d1cGpvb0hEd0xDWlRnWll4WUQ1eENFbWlu?=
 =?utf-8?B?UC93WDhaMFpKYmo3Ym0zRFlMbG1TNzR1eXczR2ozMDEvY0tiWXpvTDZuanA1?=
 =?utf-8?B?YVREZSt1MXJmbE1UcHJjVyt0OXFOOGJTKzNNRVVackc5MlhCbTE4bms3MWdt?=
 =?utf-8?B?bHc9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 957f2d3e-4929-4f21-8e15-08ddb26002c3
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2025 14:12:39.0689
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ctO6PE/4Cj9xR1NA0AH8qSHdlqs150tpYyDJhClvpSYke9KDIkmC9vrt5BAzOS3OTAAt2rSFEv2aDihY+xjM6qj4vxbrw0wOc8apJJp1fKs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6863
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 23 Jun 2025 14:12:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7157

Hi Robert,

On 6/22/25 11:12 AM, Robert P. J. Day via lists.yoctoproject.org wrote:
> 

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

