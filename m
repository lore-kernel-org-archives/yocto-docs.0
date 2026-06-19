Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9C0ECD98F2
	for <webhook@archiver.kernel.org>; Fri, 19 Jun 2026 14:39:25 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.7])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.43996.1781879960805312641
 for <docs@lists.yoctoproject.org>;
 Fri, 19 Jun 2026 07:39:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=lmFVvZM6;
 spf=pass (domain: cherry.de, ip: 52.101.72.7, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K07AIln3BN8hMgPbmv/04D/42MfLY99vXoSrBJHObElIB42YgeKAnRsrFvR4DgacNhb02jt94I3TwkSYcEvaxc6BLGx8Bw155DNRpyEI2Y4jm2+VrC4SdAutTfMV0RBjyaxtxqlw32JpMUFYyj2+gHBC8ilN1PdgQ0w6WnAhlKDiuCBhhLKAHQ9V0azxrIETSg9epqbgJuH7ThK3OMsuyHcGiGbubo7Q43MllZmmDqD5ZkXeX65q3nJn+S0WYes41DNvwF6nWzP+PjkeNBvtsMH+lMJD/y+YuuU0LhdNM5RgRSaC8tuopUOZl3VcLStvW1ieVOQEt5lNnsrpWmzawA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fGGfo7xX9PjwFpvhkRabZl/KqCZGxafVfKfDaEk3T5E=;
 b=klOq3PdWGU/QCA6U8M74qo94MdDivRwwu0v4T2eBU9fuokIAKyI2UIMdAqdEsdqP2RdV6RFwMFjYoxytGJ6FykTOwpZ8SyP26cmT8HnMTl6CvDardyuvC2e337mJkq5f8USDsTgZBNJtXTsQT329a6bXeXlaRWxMrpxhx3rerXqOQSNWNCAgl5gD7riYMMLrqm0QsbQqKWQItpB60/3ed6ULWRSqn67v49w7+FaPvK+jBtLCLQ4h9pk6uTUReDbaHlQwhsK3947qrCxu1cTojBgI/4lhZ/65PUu6Zq82Qpz56nynwGnj/JZBu9NjqeRwUZyAxhZA1vxB+fQqkLSmnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fGGfo7xX9PjwFpvhkRabZl/KqCZGxafVfKfDaEk3T5E=;
 b=lmFVvZM6iT20cXyXeoSssv+tI1/hCz7BXFGZVnRbCLarfbAz7sBsSNkheB9J5R9U41mCAk0tXfUkYXqPmkOeC6wreXlhfHHFXUoHcin8UFMjmSqEDPy2HGS7vddr1qRrOTAPPmI9eRW5q6yrAdwblyEuDVQH0HymWSjHp1jTEWQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from PA4PR04MB7743.eurprd04.prod.outlook.com (2603:10a6:102:b8::20)
 by DB9PR04MB10067.eurprd04.prod.outlook.com (2603:10a6:10:4c8::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Fri, 19 Jun
 2026 14:39:16 +0000
Received: from PA4PR04MB7743.eurprd04.prod.outlook.com
 ([fe80::9a4e:252f:2fd:97b7]) by PA4PR04MB7743.eurprd04.prod.outlook.com
 ([fe80::9a4e:252f:2fd:97b7%6]) with mapi id 15.21.0071.010; Fri, 19 Jun 2026
 14:39:16 +0000
Message-ID: <146a0753-e32f-4a84-bbac-dfdf5fb43f64@cherry.de>
Date: Fri, 19 Jun 2026 16:39:15 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH] dev-manual: replace period with comma in list
To: rpjday@crashcourse.ca, YP docs mailing list <docs@lists.yoctoproject.org>
References: <7c04f7ec-cc79-147b-dbbd-bd59f64d82cc@crashcourse.ca>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <7c04f7ec-cc79-147b-dbbd-bd59f64d82cc@crashcourse.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR03CA0067.eurprd03.prod.outlook.com
 (2603:10a6:803:50::38) To PA4PR04MB7743.eurprd04.prod.outlook.com
 (2603:10a6:102:b8::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB7743:EE_|DB9PR04MB10067:EE_
X-MS-Office365-Filtering-Correlation-Id: 70e68374-aa41-4f5f-cb83-08dece108a09
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	eq19KuIekje8tPsbn7JKLMTUxj4du7aGlPzHlJ5X1/ypIXaSITBhSeLCbluH0csGQXiJVIcT5TWL9uQQYSagbtewX4iEiZt16tvXF9xXLBcunQtjEqvCp/yF3a++LKdBwjmaxz+sbN6/d4V9qgfyzs9Ww5Dg4PjzHQ0pGwrjIweVVPcz5KFjSDWunr7EYbBBMidgWYXYv+wgeM6HZoex0nrecm3Bn9Qxeil9/wI+kdqlQtIOp4MaQedgh5viRLz8Mcf/7LVRdV4E7x7vNVGBQQn9WCTkYxxgA6iovDgCb0/MB8hZpynBaUk4KtwQIyUxzselcIW/vysfXuUG0/Zz5aouL4mIyzsH5+NYV7xzXndy0hAsugQc/Ciox2AhQFPzkFSBsVcQ79dKNDC7Nv0VMgiQ5PylRJUZsbsjuU2qhaIsRvdsgPbxiX5CmUWrKitHHXbMPJ1kVMKV2dGPGUFBsC229xvs3BUyx+ZhOBRKEg8SBmoBrJF/6A8VhJucy17LRylv6uGPLNxarCRfS5DHAm2m858kVtdhcdRN2LZ5RoUGI7zOuY19EINLfzVZamYqIXj/0ckkZgQoI5O95wqrnp9hEUXSW7J+AuLS/bLdvl/AIo9t8q3UJZiu3loUXdwVIAa6kntmqTUmdMTOpAKd1uZr8vhVzDXmzw8iiwgRaAg=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB7743.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?TmhvNHRadmdHM0lGWlZrU052azE5aUREWEQ2eEcwL0NXUnFPdlV5bHpnZXJP?=
 =?utf-8?B?enlPVlJEVTBDTms2Skc2WXpLYlhwZzA0MXcwNC81UDF0N2x5aUhKbUJQQUJw?=
 =?utf-8?B?MXNGNEZUNDN0ZVI2aGoySWErekpWWUtVS2pEZXl6K0hzcVFURmVaRUJaVkFD?=
 =?utf-8?B?cnAvWWhuQTFsT00wdG4vcStiaHVxQ05vMzNhMkUvMmVQSGYzTDRlTGdmOVNZ?=
 =?utf-8?B?aEhnM0xpQWw5NktIbFBULzA3OUs1aTNiNStzdlNXam1FMnhkWkVBVlVmNEw0?=
 =?utf-8?B?QVNaaHdnMkEwM2FDMWg3U2oxK2ZpRUF5TlEvV3VzSVVDZmQwY2NHcWxBT05J?=
 =?utf-8?B?UmV0SVNkSXYxOG1LTkhsTndRVm4wK0xTQkcxSEx6VlBYdHErNkx4elczN1Bz?=
 =?utf-8?B?enh2QmxLSHNIWWhhYVUvaFVaOWM3R1FhMXlmb254K05kRi8xQXFjNXZDNWRy?=
 =?utf-8?B?ZVM4VUJjSDMzRmNXMmVMaVYvenh2ajcyU083dk8wcEs4Z0VCOFVRYVF0WktR?=
 =?utf-8?B?TTJPZUR5NzNDMlpZMDg5MExEYjl6UDdkK05HaHAzQm9wdHJMVVNMTHkvaDlT?=
 =?utf-8?B?MEJwd0dpT3hGbGVoWDFOQXZSaTV3bjd0aSt0dStGZ3ducFVISG54VkNjeUZr?=
 =?utf-8?B?TysxQ0F1dnVCczF3SjIxU04remx1dEhXN1RRNnc2NzAxbEZtSXRFcmNiekRj?=
 =?utf-8?B?WkNRbGtUMjVSazF6MENJM3pMejdzZ2pMRTYvVU1OTFMydFd6MFJTMCtiV0or?=
 =?utf-8?B?TmpQaFlkOTIrQVVWbW9DZWpoQXpBS2dtc3lDN25NWkpDYVNpdkxPcC9iRlNM?=
 =?utf-8?B?RVI2cUM3c0xKYm81ZVNRR3dUdWhUWmU2emZsU3F3bEQvb3Jmc3NKSHV4YURj?=
 =?utf-8?B?TmlweDdKQ29tNTJ4TUVaRHkvNkNxY2ZvMnB6dUJ0dUFuUldLMzBBcTgzRWZi?=
 =?utf-8?B?NUlBK0Fwd1FQWHhaM2xpYzAzYndqaUR0RitxSFlRWFZXajdUekI0cFk4cFRC?=
 =?utf-8?B?ekRIem0xaFFJWlhCMmZuSmw3S0xLMVAwOXc0RmtiZzlaSXdKS3dKWUNPKzgx?=
 =?utf-8?B?d2QvTTF0QURuVEt0S2hmRlVNaVVrbUZhYzlvU29yVlhLWXN5cG8wMUxYWm9u?=
 =?utf-8?B?bHJlWGljNE1iMnV0ancyTmJOU2ZITmg2T1A3WmgwcmpYR0h5YVExcDRVVlhP?=
 =?utf-8?B?bzkxeStkM1BkT29keDV3bXR5Nno5dmlzVEIyU0NoZTVRL2ZMODczZmpnb21T?=
 =?utf-8?B?WHlrL3o2RDVuSDR3dmdpUWZNTlhGRmtDVXZRZWs3bWFpN2JlMm9pOENPeUp4?=
 =?utf-8?B?VysyTXB0dzNJR0hUR24rZGZ1M1B2YUIzQWhTRjlrVFBOb2x4WHpZTDFXaUFs?=
 =?utf-8?B?MGh4cGd6SlNjYjc0T3JWUXdJU1dEUFNQUStyVmlaSkJFdWhJYS9ORUtmSTFM?=
 =?utf-8?B?MU1HRjdGQzJRUWpMcTRBY0JqT0dETG5zMWx2MWVOSXhpS2hONDM2dVBXWHBF?=
 =?utf-8?B?cUQwZGJXYS9nM1JMbFE1VHczQ3RmYVlvcUN5dm5BbkFkYk1FaENXREtsMXBh?=
 =?utf-8?B?aWR6clhRdXlQTElNQ01mWTZOVkUyNnpRRmR0cDVQNXFZMkIxeVU4bWpzMmdu?=
 =?utf-8?B?dzVmVzVYM2pOdUY2SHVzTGM5YVhRUnYvdTdETStTdnhVRS9YRmpKOTVoWURN?=
 =?utf-8?B?MGcwSHhZRGYwREtmN2xaMzJUL1dNM0JnczRicnFEcUdWeFB2aCttMndPbllu?=
 =?utf-8?B?NEVtYU53VmJib1lNZ0VSYnZqeDVsMzhNdUxITVVEYURBR2lrY0hxeHhrS242?=
 =?utf-8?B?OU5oYnpXSEh0UnJpU1U0NHVoVEx5ckFUVEFVbkcwR25SbDF6WUYzL0dUeWQ4?=
 =?utf-8?B?TnFxc2FSSG1UMHVDWVZaSHp4bU03YlNUZ1lPckt4MWpick5KUk1YZktnSkFW?=
 =?utf-8?B?RjVSSGl1Z3RRYXZmZWtMa1g1Y2M2T1ljWWxvNFdXOEc0M1RTQjZ4VjREMWRE?=
 =?utf-8?B?aFB3TkZpaFgzYldyZVlqNXRFS0xMMHRsTHkxTkhKZGt2bjB4VDNVNnV6L014?=
 =?utf-8?B?YWF4NjR5dWNjWlpjbWtRT090eXdZYnRVbnZGc3V3eUVGRXdFQW1TMFlCUEdj?=
 =?utf-8?B?blk3bU1UOW16ZHdzYkVKZnNFNExXUDRHMURMVmtkbXJXdWNtNWpmaU9DN0tL?=
 =?utf-8?B?aHIvb3dsUUkyNmlOZ0FleTFSOC8yK0hmOVk0NFM0aEpoUHgwTVNPQXJYaldO?=
 =?utf-8?B?aUNEU2FyVmpHdTFrNURnbmIzSGdKeDgwSVlJYmhzalVVNlNTaHMwYVdGVGlX?=
 =?utf-8?B?YUFkVzRkR2ZPNUoxeGh4YVBoV2lmd0ZpeGg0WXhTcElkSER5OHhxUT09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 70e68374-aa41-4f5f-cb83-08dece108a09
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB7743.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2026 14:39:16.5874
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pN5hC1EvdBi1aiMIShJIUABWwIedyWNeLTxozozbn/c6wDqiLTW3enpNjXvt5F8FyQLRZYvCpyzh0dW3y5PXm7OFIdGw1XVQmGLjSt7Oy2s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB10067
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 19 Jun 2026 14:39:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9788

Hi Robert,

On 6/9/26 2:12 PM, Robert P. J. Day via lists.yoctoproject.org wrote:
> 
> List of checksums needs a comma, not a period, in middle of list.
> 

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

