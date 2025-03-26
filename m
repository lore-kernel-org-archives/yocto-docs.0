Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A40BCC36008
	for <webhook@archiver.kernel.org>; Wed, 26 Mar 2025 11:39:28 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.3])
 by mx.groups.io with SMTP id smtpd.web10.20002.1742989158131481270
 for <docs@lists.yoctoproject.org>;
 Wed, 26 Mar 2025 04:39:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=MP6YFpNk;
 spf=pass (domain: cherry.de, ip: 40.107.159.3, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CCdK0So5/lKRvQat7khSFu4/yTnSpsUvHmUpuydztdPGy8Gsmn/hQrzvlYpRsfoNmBSlH8hUNTV1NdX/uudWu86PbOqjoUocBwgFxH4ly+4jX4bOF7f98BwXCsDIm2Q7IHsOGqHq7wRdzY0XVzCOc1JX0oKHNintvedF5HIHqYCkUFk9NKVXDJlRlfMqRjTOy8rP9njYKTfE1GWTFgUG38ShX2BTdL+fNmG7y5L73S9C2/RONwfA2Tgvj3m0krD5akKUveQI7iITPOadzKq7AFRb7506XGTwtFKlfzM2i9Z9kcp+zX2AO8sgIke0gCdjtSrDRlCJUO1bgY9m4x+4XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lYts7eM3o5ylpWaXkL0IGg88+aiZXVs94Ot1QIi0RW4=;
 b=MV9SIRLeim+yaQ0+CgAIrlMtkn/7asXvq9uy71uI+NGuhaieMwGpZwr15arq4Bi2n7wflr2TIL5ZzcOOSYxlO3wAC5PNbN8upvL6nBIoQIUap6nQ5NQQixji7tnzYsGCTzd159vTinqXyZ/BNLnev7AKdsbzvALPRpJmYa4WvaIhCOKFxaGasEvwSXgWqSumxK61Drl+dLPzKzb2F5pTn+2HT5n2x1UyOuaJWqFLZXQLEjaNEsCq9dwuy4StoUOUodEyJ8edFDxqgC7YwdZeBgH/Qq949SD2DpQ4ArMYxa1e2Bxslv0DHJfOJheegjOBQkL0DTkT8dU3hN3CcToOZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lYts7eM3o5ylpWaXkL0IGg88+aiZXVs94Ot1QIi0RW4=;
 b=MP6YFpNkuLYEjcrm2TpZ6jhfcxOy52JmywKLk0jW/w33Q2eEGfBiNVmUrVdLQIzNX62X0nkVN9grcT+AqZDRgWcLrJicEOqL03qUMtA8Gn2tUhefp40fPtMR8DPeeT9U+qVvuFt11M4tMsxTiEyoEcNbJSEFkGzHU02QQmOPcJ8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by GVXPR04MB10407.eurprd04.prod.outlook.com (2603:10a6:150:1e9::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Wed, 26 Mar
 2025 11:39:12 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%6]) with mapi id 15.20.8534.040; Wed, 26 Mar 2025
 11:39:12 +0000
Message-ID: <191a75b3-caad-46b9-b652-c3d01d1650dc@cherry.de>
Date: Wed, 26 Mar 2025 12:39:11 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH 1/4] ref-manual/variables.rst: add missing
 documentation for BUILD_* variables
To: Antonin Godard <antonin.godard@bootlin.com>, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20250317-cc-vars-v1-0-25edbadfd054@bootlin.com>
 <20250317-cc-vars-v1-1-25edbadfd054@bootlin.com>
 <29a6499d-22ca-44e2-bbda-2148ca6ba8b4@cherry.de>
 <D8Q32WJD5YSK.2036RNP79DLND@bootlin.com>
 <49b57527-5458-45ba-9e3c-524b435e20f5@cherry.de>
 <D8Q4OUK00NOF.2X7V7MVYQZZTH@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <D8Q4OUK00NOF.2X7V7MVYQZZTH@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0080.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::15) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|GVXPR04MB10407:EE_
X-MS-Office365-Filtering-Correlation-Id: fe16e953-1988-4771-4730-08dd6c5ad457
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?TktGTXFPWWxId2plN002R09Gd29MS242WGRHdUltelVUaUlKNE1HYndoNmJL?=
 =?utf-8?B?c016QTR6WldZVHZ2cXBHQ0kweGM1Vng5MXdtSDIwcWJVYXJlWXRpNFFtdnRK?=
 =?utf-8?B?UDk2ZWpQY0lMK01EeTBaWXZkTmJPREI2YzFqWHc3OEt1dm1QWFFOdElwdnZl?=
 =?utf-8?B?dWhHZHRxSjl4WEFKRlpjU2JLSGVQRWh0bldvT29nMXdhQjIwd01BdUxnbVZG?=
 =?utf-8?B?ZFN3QTZHN0Q4UGtSejNuL3Q1M2oxa2E5YXMvWkJGeStDekJwZ25LYkdHOUpZ?=
 =?utf-8?B?bTJDN29KeHFKZUZQcG1menhlNHcxZGVCa1VEUy83S0xSK2dsek85bzYwT1cy?=
 =?utf-8?B?a3phNEJTWm91MDEzc1hsQ1BvS0wrWWhHTVFsS0FETzZTMUR2WXdkUkRIcEda?=
 =?utf-8?B?SGl5azluZnVVd240WUFyOXNNZ3RWZW1GbCs3Y05PcFhxQ2xTL0VJTEIrWjRM?=
 =?utf-8?B?YTlEV2p6RzRqZEg2U2pGbE5zTnkyMEJKSVA3NTFWaklvSFVCYmNQelBLMk9r?=
 =?utf-8?B?UFZHS2hERUh2Ym5xSTYrakdFQ0l1dCs4a3gvMHFaNGZmWmdSbkVDV29XejFn?=
 =?utf-8?B?VW5LYjdYOUlCM1BIZVVDWkQzSU1zd2I1ekZvVGpuSU9EeU1FdG9ZTEN6R0Vy?=
 =?utf-8?B?NktkM2ZwRnFKMHdMK05tMzNIUUgwZmN4MUkrVlczTXBmN3JBOCtkbS9CRmtS?=
 =?utf-8?B?aW5sREg5elJzWHVzWjd6NE9XUGxiTUkxNGVyZ1ZHakE0S2FtaTkrVGRnK056?=
 =?utf-8?B?OHVPRXp2YjVmNlc1ODQ3dUJSYmtSbVZFaFp4TjdXQXJwQnRHdXN1ZUc5M1VW?=
 =?utf-8?B?UzVMcnFucnRCYmQ1bHNSelhidmlWMTU4TGdxSlhhYjRCTDVEZFU2MmtJM3Rv?=
 =?utf-8?B?ejh5b2RaU3pkUGwrRUN5YlVBd1pjcXJLU0NXKzNXdVNLTGt3L2FLTWpRNFNP?=
 =?utf-8?B?VTdQQXJhaVR2OSttMTRSSDBQRWkrQzVuRnh0ektxaDNQcmZUQktiQUcvY1lT?=
 =?utf-8?B?Z0hiWjQyTTR3V0xldXd5UzNZdGNFWDEwTDJwb21zdnpRZU8xY3hrcVEyRXUz?=
 =?utf-8?B?Wlk4SkRtK1FaWjRQRER1U0wvdkM3R2pJYk05b1lHVUZTbnIvV2dmNjZGTEp0?=
 =?utf-8?B?ckVYOW84TDNDV2tyWlBWWlZsem50VTVSeHNhNzdXZGEzSEVkNTlFeTkxQjlB?=
 =?utf-8?B?RjV5MXNralNzZFRXeE54WXJIcUtOclRReUUzenVFYzFYYmIvczFjaTV5aUJ4?=
 =?utf-8?B?MlZ4Q2JBNjNLZlRiVVRCZEZ2d2tWaFpJb2NMWENVWWlEaGdqMlNOVnBUQ1hX?=
 =?utf-8?B?WVgvclNkSHBHUkFYRHMvVW9WMi9yRXhBdkpsZWc1MGhJOFZIZkczU092bHdN?=
 =?utf-8?B?Slc4Vnd2Q3dPNWFHN1pCbG5lRFdqeXZBUS82MzFBbEFDRWtZQ0ZHaDMwbFNl?=
 =?utf-8?B?c0tvNjEzalRwUTVrenZFUUhYOTlhaUpuQ3FOU3NsSW5oQzlzWU83Y0ZjTU4x?=
 =?utf-8?B?UDg0Q1lrVURIOVpxMWxDanlCZDFYTTFub0dCeHB2OHRqZXMyY3dQMHBrT3Vm?=
 =?utf-8?B?em0zc2VWUVFBZ0hYbmJSMEwyRDJjbVhnMWJBQWFlak9jWjJ6WUI4T1ZLaGRw?=
 =?utf-8?B?bWlSeHpMVjd5MjI4alVBZndmVzkrK0hkUnppUWpTbktJeGNBVmJDRks3R0FP?=
 =?utf-8?B?a3cwOExpWGFVWkhmSkhsL3BtSzl0K3B4V2haTmdsRWpIS0RqWW91aDlFcnlr?=
 =?utf-8?B?YkFVQ1RPR0RKalo5Zjl0UUhiaWVFM2FXS2FXd0gwOGVqN0VqZW9oVU05ZzRB?=
 =?utf-8?B?Nk1VL3ZXM0ZYQk53Q2RGM1hNNVg4amFOUDBEeTNKZmwrRXlCK1BiRi9OUzR2?=
 =?utf-8?Q?YfzaFmq1cjduH?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?aHUwOUhKUTM0N25jRFYweFR3S0swR0pZNE5XNFJhdjZyQ1pYS3Q2bkExaVBF?=
 =?utf-8?B?ZTgwV2pGaXNmVENTQWtvS1BmUnVBNWxaOVlmY0cvNXdIeDg1WTBlM3Ava3Ir?=
 =?utf-8?B?THloNGlZYS9venB2WVJGYVJLbjZnL1pZQkZPbnpxTStlWEZERU81b0xiZDh3?=
 =?utf-8?B?YjdDR1JOOWF2QmFWS09YUkR2SG5BYWUvNUVONVZ5TXFxdkdqK2RYS2RLK29z?=
 =?utf-8?B?TGhkQkw4aHhwcTRUOVJzMUhNeFN5ZW1Ec1MrZXF1VnJEbndoZ3hha3o4SVpX?=
 =?utf-8?B?cHViT3NpalcvNTZyN3pMNlY0Z0l2bG82MEtZRnZuWTVCZm9pSkpUR2dIamFR?=
 =?utf-8?B?d0ZBcE05Nm9leUtta0xmSzh3eHQrWnVxYmtEWHc2Uk1RNzlUWVZReUZTTG1k?=
 =?utf-8?B?WXhneFlaazFDUmZ0YlgyWGlyUXFNbWNVMjlTLyszbHF3NE9UNU0rd3dMZ25x?=
 =?utf-8?B?aVpBZkRSYzREQ3ZLVFhIbEkwMm5NZy9VdjFnRUxTQlNyTFlGTzJBcDEvNkZz?=
 =?utf-8?B?UXEzZ2pjd0t4eGxCZmRlb3RHWXl6dkh0NGVpMWZHRGR2N1ZpU0RRblNUaUkv?=
 =?utf-8?B?VDF4KzJrWVdlVWt1aHVNWTZVdGx3OGtuWTBZWWM2VTNNQ25PTHN4b1lOVGpp?=
 =?utf-8?B?S0NLSHU1S3JGZ0xjVWhQZEdKM09scmFUMk1OalJOOVZZOXF3bkxTOU5Na0RE?=
 =?utf-8?B?MnlFSktkTVN5VXJEZWFKcHhuZk84YU04MlpJczZaeUpMeXJrTkFnVGlkQzgv?=
 =?utf-8?B?TThUQkVMNDEzY3BwWjllYTBCakZFODdIZjZOTS9KTE5oV3R4aWt4NFNBVTR5?=
 =?utf-8?B?aDRlUnBMTTJXMGxlbDNIcEJ6dGlRc3hrcW1SOFdpMjNHMlpEK3NmU2JrRXpj?=
 =?utf-8?B?RnlHUkxoTTlOb1doeHU4N2Y1SW9sSGphWXRwZHRBOHNTTVRvWkpBTkE4OGpr?=
 =?utf-8?B?QnRDYTFFY2JSUnc1Q3RZQUU4QmNmWklvMUhucXFwM0FYYUpnVU9Da2duTXVn?=
 =?utf-8?B?bjJqTmZYOTVOSEhjdEJhYXI3ZDhULzVuamhKRHgweHdzRmFWaWFrUmpvMTM0?=
 =?utf-8?B?RHFDOGNPY3B2aFlnakd6L2c1NWlDWkFuRXoxeWhjUFFOZFU0dmNnUkhHands?=
 =?utf-8?B?K1Vsc1RiWk1UOGkwUnhuOXdLOGtjRENxODY0ckhzcm1lRysrN05uUUlncXlk?=
 =?utf-8?B?a0tJYVYrUU9IMGRMTThJOE1laFdtK2pjMFA3QS9xalF4VzFwQithR2U4eUdW?=
 =?utf-8?B?WHFibTU0cklIVlpSbzMrZFdjZmpEKzdwdG5kekxpZzBJcUJQZE1ISUJoT00z?=
 =?utf-8?B?TW5nZDRRS2ltcDVtR054YWthRUlVZWMyVDE4eVRqREtJVXZRbjFTamtFYXRD?=
 =?utf-8?B?b3NOOVBEcU5STW1SYUNJcVhIZHY4R09oWTg2U0tVVUZaVXNSLzFzSlpra205?=
 =?utf-8?B?aWFJc0hnRll6ZGZHdEJzbE9LWEtDU2RMcWROcXUzSmUrQ1dYVWJLYi9rZWUw?=
 =?utf-8?B?dDV2NFFTMS9ReWJPK2YxR0RjK2hGMnZmaHpJVmhlQTVWWENWWTZsVzlPVDRS?=
 =?utf-8?B?N2Y4VXVNMlc2RHFPYkpRVFVBYzc5VmppdjYrYzA4TFZkUmhkcEZsRFlFaUJ6?=
 =?utf-8?B?TUpDYUlsbDZuUGZDdlU4b1hCamRDVjNKNDZaOXBlYW56OU12NC9RZ3lHYmtP?=
 =?utf-8?B?bGpOcnJvTEdZNTdhamJyMEE4eXYyRVpMM0ppSDlzUUVNbFMzbk9UMFR6ckpu?=
 =?utf-8?B?UjlsMjRLcUxXajBaWDZBZzQrcmo1WlZsMnY0LzdieTByRnVaNStOWExPYTdh?=
 =?utf-8?B?T0RQYUJ6QmdzYnF5cnBNSVRtVWxWR1FSQjJqbXJWZWRjU2xzc1Nmd0hvV0FL?=
 =?utf-8?B?SWJueHFEeTI2a2xzZUEwd2RsbUl1VTd0S1lZSGM2K0xVMnVmWjlmcGtCTGdv?=
 =?utf-8?B?NmQvTnhQcEVmMDFHOWN1d2Y4bGQwTDhWU01Gb1pKSXhSN0ZRVnVmY1BWMnRl?=
 =?utf-8?B?dDRvSmlDVE1kWlpuamZIcjRRSXIvTU9YVWlRdEMzMldLYzFYdmo4UXlKTXpq?=
 =?utf-8?B?eXR2UUNGckNrcjJZcGlsQmpicTB1eFRycklpZmZWeG9XemhxYVhxdU1hN3VE?=
 =?utf-8?B?ZmFwKzlrYVozVER0MGlIMlM2SUowUlgrRTN5UXI2dVo0MlF2N2xtMXhvWmZ3?=
 =?utf-8?B?Rmc9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: fe16e953-1988-4771-4730-08dd6c5ad457
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2025 11:39:12.3771
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HYyfUFbzjFtW7nY4dkc/vOBTvAAk1HY9GU3E950cfdZJQKjeneIP+/5YM/dUL4950Yce3l+7aWhOZ+FqgCFxJGZy+Hytz5+LG72IyedkvMA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10407
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 26 Mar 2025 11:39:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6633

Hi Antonin,

On 3/26/25 11:33 AM, Antonin Godard wrote:
> Hi Quentin,
> 
> On Wed Mar 26, 2025 at 10:49 AM CET, Quentin Schulz wrote:
>> Hi Antonin,
>>
>> On 3/26/25 10:17 AM, Antonin Godard wrote:
>>> Hi Quentin,
>>>
>>> On Fri Mar 21, 2025 at 5:22 PM CET, Quentin Schulz wrote:
>>>> Hi Antonin,
>>>>
>>>> On 3/17/25 5:03 PM, Antonin Godard via lists.yoctoproject.org wrote:
>>>>> These toolchain variables are used in a native context. Some of the
>>>>> BUILD_* variables missed documentation. Also, some of the base commands
>>>>> were also not there so document them (FC and READELF).
>>>>>
>>>>> Some of existing BUILD_* variable documentation were missing the note
>>>>> about their usage in a native context, so add it too so that all BUILD_*
>>>>> variables are documented the same way.
>>>>>
>>>>> [YOCTO #15719]
>>>>>
>>>>> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
>>>>> ---
>>>>>     documentation/ref-manual/variables.rst | 107 +++++++++++++++++++++++++
>>>>>     1 file changed, 107 insertions(+)
>>>>>
>>>>> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
>>>>> index 861b04eaa..24b3f7db9 100644
>>>>> --- a/documentation/ref-manual/variables.rst
>>>>> +++ b/documentation/ref-manual/variables.rst
>>>>> @@ -985,6 +985,24 @@ system and gives an overview of their function and contents.
>>>>>           variable is a useful pointer in case a bug in the software being
>>>>>           built needs to be manually reported.
>>>>>     
>>>>> +   :term:`BUILD_AR`
>>>>> +      Specifies the architecture-specific archiver for the build host,
>>>>> +      derived in part from :term:`BUILD_PREFIX`::
>>>>> +
>>>>> +         BUILD_AR = "${BUILD_PREFIX}ar"
>>>>> +
>>>>> +      When building in the ``-native`` context, :term:`AR` is set to the value
>>>>> +      of this variable by default.
>>>>> +
>>>>
>>>> It's not entirely clear to me from the text, but I believe we should
>>>> only be consumer of this variable? Or the toolchain recipe/bbclass needs
>>>> to set it accordingly, but otherwise nobody should *modify* it, right?
>>>
>>> Actually, users shouldn't even use this variable directly but only AR (see
>>> the explanation below).
>>>
>>
>> Then we should make this very clear in the documentation for the
>> variable. Essentially "treat this as a read-only variable except if
>> you're adding support for a new toolchain" or something like this.
> 
> I've found the following wording:
> 
> """
> When building a :ref:`ref-classes-native` recipe, :term:`AR` is set to the
> value of this variable by default, so there is no need to use
> :term:`BUILD_AR` directly.
> """
> 
> "No need" is less strict than "never", because there might be some niche cases
> where you would use that. What do you think?
> 
> Take meta/recipes-devtools/meson/meson_1.7.0.bb: it uses it in
> install_templates() which is called from do_install:append:class-nativesdk(), so
> here since we know we will always run in a native context, we can use BUILD_*
> variables. Although I would assume using regular AR, STRIP, etc. would work as
> well.
> 

Seems like cargo and rust classes also need to specify BUILD_AR explicitly.

So I rescind my comment on not using BUILD_AR directly, you just 
essentially don't need to set it and only need to use it in target 
recipes when wanting to point at the build host `ar`.

Same for the other BUILD_* variables.

> [...]
>>>>
>>>> A user question: Should we use BUILD_AR directly? or always AR?
>>>
>>> Always AR, to my understanding. The native class takes care of setting AR to the
>>> value of BUILD_AR. In your recipe, you can use the AR variable to do your
>>> things, and its value will change on whether you're building the native recipe
>>> or not.
>>>
>>> You would only redefine BUILD_* variables if you were to add
>>> a new toolchain, basically. See toolchain/build-gcc.inc in OE-Core, for an
>>> example.
>>>
>>
>> I think we should make this very clear. Essentially:
>>
>> """
>> This is only relevant when adding support for a new toolchain. Users are
>> strongly encouraged to use :term:`AR` when wanting to use the archiver
>> in recipes.
>> """
>>
>> or something along those lines?
> 
> See the wording I proposed above (which I will propagate to every BUILD_*
> definitions).
> 
>> (same remark for all other BUILD_ variables).
>>
>>>>> +      Specifies the architecture-specific assembler for the build host,
>>>>> +      derived in part from from :term:`BUILD_PREFIX`::
>>>>> +
>>>>> +         BUILD_AS = "${BUILD_PREFIX}ar"
>>>>> +
>>>>> +      When building in the ``-native`` context, :term:`AS` is set to the value
>>>>> +      of this variable by default.
>>>>> +
>>>>>        :term:`BUILD_ARCH`
>>>>>           Specifies the architecture of the build host (e.g. ``i686``). The
>>>>>           OpenEmbedded build system sets the value of :term:`BUILD_ARCH` from the
>>>>> @@ -994,6 +1012,15 @@ system and gives an overview of their function and contents.
>>>>>           Specifies the architecture-specific assembler flags for the build
>>>>>           host. By default, the value of :term:`BUILD_AS_ARCH` is empty.
>>>>>     
>>>>> +   :term:`BUILD_CC`
>>>>> +      Specifies the architecture-specific C compiler for the build host,
>>>>> +      derived in part from :term:`BUILD_PREFIX` and :term:`BUILD_CC_ARCH`::
>>>>> +
>>>>> +         BUILD_CC = "${CCACHE}${BUILD_PREFIX}gcc ${BUILD_CC_ARCH}"
>>>>> +
>>>>
>>>> This seems very gcc-specific but I cannot see the same thing for clang,
>>>> so I guess it's fine?
>>>
>>> I will mention that this is the default value. Indeed if you were to use clang,
>>> the definition would be different from this one. I think there will be
>>> evolutions on that in the future, because the toolchain/ directory was made
>>> to prepare the ground for supporting clang (I think).
>>>
>>
>> This is actually not the default. It's set by the gcc toolchain, which I
>> assume is the default (and only?) toolchain.
> 
> For now, yes, I think it is the only one.
> 
> So, saying that this value is the default is not wrong since bitbake.conf does:
> 
> require toolchain/gcc.inc
> require toolchain/build-gcc.inc
> 
> ?
> 

Well yeah ok, that's the default then :)

Not entirely sure how meta/conf/toolchain/clang.inc should be used, but 
I guess it'll eventually come :)

Fine with me, rescinding this comment as well. "default" term is fine.

>> I assume we want to state that you should not modify this variable,
>> except if you are adding support for a new toolchain, but you can use it
>> wherever the CC (for native recipes) or HOSTCC (for target recipes)
>> variables are expected to be set?
> 
> I feel like there should even be a separate guide/section to explain how to add
> support for a new toolchain at some point? (how common of a task would that be,
> though?)
> 

Considering we still don't have a second toolchain for the very popular 
clang, I'm not sure we'll have a third one soon :) But doesn't hurt to 
document the findings for when the second toolchain will be added, so 
that a third one would be easier to support.

> I'm not sure we should in length on adding a new toolchain in the BUILD_*
> variable definitions.
> 

Fair. We can point at the terms from that yet-to-be-written "how to add 
a toolchain" section.

Cheers,
Quentin

