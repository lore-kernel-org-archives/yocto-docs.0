Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.29])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.623.1795195617077811029
 for <docs@lists.yoctoproject.org>;
 Fri, 20 Nov 2026 09:26:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=WqM/Ytzs;
 spf=pass (domain: cherry.de, ip: 40.107.159.29, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mkN+kSd+394kaHtHGLAo3qz8fFuG0d7bno5q6bfx/lVP61G81AkSA70WwLMF4HBjx/8RdWF7JV+PQqwWyn4bRDoxXcgg4xtkDFoOlMNMIAhkhNC3jXmu1sHX4DzFxopHE6fqug0Xj67YPJLnVDEyeMEY4hWWHTFTU7Is/YnnogXjCM9s5M5B/de8TLV3cfAzvig7JYbke1xs1jsBJOt8SG0RM6FjvB7+TIHIiiXGkHeiKzvxnW78T5ChhpSPpOB08kiX/FuIMNt5B4/cIE8Hd0aWCJt47KbvQmD/ByvRvUxWStRR9VNEnIZ0n6R5Yz3L6HD/p98jWOqeya9nA2SN5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x3B/PeVjX04tNBbEb9CNQTFF4yd988KledKmYtsqOMQ=;
 b=ZD0vGqlK3+GI5gr8Ea7VuEH7bJ2Y9AEsKCJN8RPkRBNibzW9nq8wLoUAdStLbkKW7BHCi+IT7KcH+sV7GajxaT043AALg/1KvQuKSTjCMQdippHbeuxemYVHGjmTWCH9ABQMFVPEWIGnwDgkclgDFfZi7aCv6E7U+xNdGK/tix2SDdnULoICwv00Cxyx3FsSid22zoBHPiREijqNLNqOS5OXnKRPEfll+DewaUTRjgxCQiiHvotEyuzMluVuuecKfE5yx/xJxktT4/003htSF315u2VuD4Td5uxZDtfrL3bHF35w5qvQVyxhQuG8Y4M7uHM8dN5Phb4Avu3i3670Qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x3B/PeVjX04tNBbEb9CNQTFF4yd988KledKmYtsqOMQ=;
 b=WqM/YtzsDogh0eSNjctXV+T8n1MP8mNhJzsUJLzXlOpBY83wYuhD++UGQGYzBGpFNAEU9p8wqhnZqIHsA3UsIzbKCDXXzLj/t1HwXNJAy5xiWjeo80ILqU7fHOHeCFYXGKkvp76gZ8EIbAQMNO9IQSKNVScELJh5KuGlw357YkU=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from VI2PR04MB11147.eurprd04.prod.outlook.com
 (2603:10a6:800:293::14) by VI0PR04MB11045.eurprd04.prod.outlook.com
 (2603:10a6:800:25f::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.10; Fri, 20 Nov
 2026 17:26:51 +0000
Received: from VI2PR04MB11147.eurprd04.prod.outlook.com
 ([fe80::c859:7e6d:9345:afe1]) by VI2PR04MB11147.eurprd04.prod.outlook.com
 ([fe80::c859:7e6d:9345:afe1%6]) with mapi id 15.21.0639.010; Fri, 20 Nov 2026
 17:26:50 +0000
Message-ID: <a4c205b4-f4b7-4307-b01b-9ce9d950b9da@cherry.de>
Date: Fri, 20 Nov 2026 18:26:49 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH 2/8] tools/host_packages_scripts/pip3_docs.sh:
 update for sphinx-tags
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20261028-tags-v1-0-d5ad01019eae@bootlin.com>
 <20261028-tags-v1-2-d5ad01019eae@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20261028-tags-v1-2-d5ad01019eae@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0050.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::13) To VI2PR04MB11147.eurprd04.prod.outlook.com
 (2603:10a6:800:293::14)
Return-Path: quentin.schulz@cherry.de
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI2PR04MB11147:EE_|VI0PR04MB11045:EE_
X-MS-Office365-Filtering-Correlation-Id: 56fce9ed-bc6c-4287-fc06-08df472b7652
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|23010399003|11063799006|4143699003|10067099003|56012099006|261022105027099003|261021135927099003|261026140227099003|261026121527099003|261028144727099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: /qscOTQzkCMO1WlrTvZSR3kY6Mw75FeM51G3mtBJ5UMp2FaE2edTEwQVMs0hHkkzjRyJdpDa2YgRuDiLNR/thVlHgHqnJ9/mbnmrppkIsGnui00SNZW6Be0V2l1w8e7bLSaGCJcR2qIbLwWHj7O1dBaU/kK7AnfL+4AsWmmWp+NydXsKCYNUb6MF9DwuEBSLAetXfEffWOEzhhUV9rBUnF0Dp9dvat2OXCgvpb2uD7k+ezyeosl49TJnrhb48tYuOxQuMXybO3a9nPb2dq15VqLpSD1kpp9NWIfIX+bh2bVHz+Xnom5lCEBZ7VLaan8w/zcZlRojSdMsErSUPSVCODgCoEkJETrhz4xDCgPwP5JBa4ifhaJ1y2XgU+XILCZSr51gkOd11NBhOtp0894Gl2m3sumymyZnRn6qmw+e33deCHwd5zscDTjgx477DZ6evMt20qJnRshB3GDAUtqtovCBdYZgdMrYy9GntqX1Y/k/pA9whvkjZgbssL+eaY4Is+UxJivNbn0BS4BABmixqnhzrdfqE/Qu9V42ZrN07c9yTuDkJsm1GjXc636C0w89CHeR8937W8K3IFgPzLXff8PqGCsyqEjNlqB/pkKiy+ukQiMl/PVglOwt7Yz3ZAJLeRANULfou5O9ZJj98BOYN1M9U/CJou8OZMYMbdhuZ10=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI2PR04MB11147.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(11063799006)(4143699003)(10067099003)(56012099006)(261022105027099003)(261021135927099003)(261026140227099003)(261026121527099003)(261028144727099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SVovclU3aUVuNmx5WGdsUnN5ZE42dXNMcWNRdUxKdXhFYmJxVWY0TkJkQmlO?=
 =?utf-8?B?eG1TbDZ2QllGZC9wMDZhU2g1a0dPb3czNlB3RFQ2b010d0lzK1RvVFBkay9v?=
 =?utf-8?B?Ujg4Tnp6UEZuaTN2bGNOcHRNUGJBZDQxbUVPdlFvSXhoZ3A1SmppOFkxOUZ5?=
 =?utf-8?B?eE1vTDVyendLOElsdkUya25rdlBxc0hIa1RDWE51dElUb1NWVWZueXp2UXB0?=
 =?utf-8?B?MHBpd3puK215K2FVWUJQQVNOdm9nZUFoZ3dxa3VwRSs2YlUxZjh5VkVBR0ZN?=
 =?utf-8?B?MDBRTWxwQU9ZZ2dtYXFFUmNtbE5oV1BtdGVqdVhka0xlSERhbzNpZjlScjRL?=
 =?utf-8?B?ZGtONHhtVUgxUDV3Z1lPMVE5WDNIMkpJaWFYQkJPTlZaNTJBS0UwR1NYRVB4?=
 =?utf-8?B?S216UlYxcXNQNG9JVkEwcENOWU8wNzJaLzlHN0dkejVYemZDRDlGc3NHTFhN?=
 =?utf-8?B?WHVrVms3Vno0WlhmWCt6VWZsT2hZYnQvSDN0RHpFUW41NDc3RitjUXlTK2FY?=
 =?utf-8?B?UXZCY3QrNVN6WXNtUFZuSzNaRVRoRi9uSWR2OXFMRUVhaWRWWXppSWUybVlQ?=
 =?utf-8?B?eUR5WlRQUFJSUG1hUXEzbW85RnhVdkM3dzdMbEdXUWIwY3RURURDSUxRT3Ja?=
 =?utf-8?B?UkRHV2RIVFQ0eHduQnJXRW5DY0VrTFg5WkVjMDJaeVBRU2ptRnRDMFp5V2dk?=
 =?utf-8?B?YWk0Y3prUEdycWlGZ1VHL1lHZ1BXQ2orY2QvWEpHcTdJbkxTVDBMTklXVnpP?=
 =?utf-8?B?clorcGxPZ1BRMzdWbElFRWFRd2dtUzN3LzRQUWtQUlROR1hlV0I2d3hobGJt?=
 =?utf-8?B?dTVoY0pDNWNHOG11Wkt0VWlVOHE0WTk3Tjh6QVZQT1dYY0djTksxN05pQXY4?=
 =?utf-8?B?U3Y4Vm95N0hmRkJvWFdHcnhxeFRMVkFiU1NjSjdwVmdUUndCaUJ3bEJSN0tj?=
 =?utf-8?B?aWJPd1l2K0hpUzlsblRaZVRnZHJnSlFKNStLUWR6WkM5Q3RlLzRUd1lpNkJI?=
 =?utf-8?B?eXJpWXg1Sk5RNlA1QzkvQWZhSGRWNlNwbE1nd2F4enJQVE5waWFzZHVCUnJY?=
 =?utf-8?B?WENwMllZd0ZtR1pmRGoyaUhUVUV3c0ozOEtBNFdDMkdwTXlZWjYxUWswTm13?=
 =?utf-8?B?N3g1R3FyTkFKd2x6anE0NGFKK24weTkwZTJpSjJFcDhNSzRxcjBWc3FzcG9h?=
 =?utf-8?B?Y0kySUVQTlBlcVVoVlluYVNRTURjckNLT2x6ejYzRlJNVUwveWRQd1pzcU93?=
 =?utf-8?B?K2ZZUlpFT0JzQ2FuaWZZanlhSjg1Y2FYMm5RVGdUYkhwak1xb3M0UG10RDVL?=
 =?utf-8?B?dWpKdWg2UGFRcHh6OEM4dHJjbTJtdVBjWTZUZTNNZ0lwNmFFVEV0VjY2VW1C?=
 =?utf-8?B?d1ZaSzFwVjZDdUpOL3RsK092dG5lTTBiNU1mT2xoSlR2MUIrejNOZGlKdlhy?=
 =?utf-8?B?YkhhejFGWGc2RTVaUUtYTk4xSTFHK05qcURST1J3R0hNTzV1aUM3LzRnK2Yv?=
 =?utf-8?B?VUpOTnlEVkJ4K2JsUlhCYVZVcE9LTFUrZEV0cVhWUmZ3akdHM0kzNGpoUUQy?=
 =?utf-8?B?ZUFEVTdlV1FUTTVDcDJqNWJhQkt2WTJQZTRSQS94a09mcTRYSzhhYm5QWFBO?=
 =?utf-8?B?YTVJMEJiUXNaTkJ0M3lKSkpCelBxTWhEQlEzY01CbEUzZ1dHbFgxTjB5dDc5?=
 =?utf-8?B?VXRrOWlGOU1JdUdDb1dNRkd1d0tDbkxkZTZYTmJrdUtTOUxzWDZ3U1lxZzFh?=
 =?utf-8?B?NHUzbWdybjdXSy8wQVlRWXIvZWFJbEdDMCtFNXlUaTlaeVJjMnh0M3RtdjNH?=
 =?utf-8?B?cEMvcVlVTHMrUDdZZDdIVWM3RVB1OEZJMnR2VUIxa3gzWjFTamdCOUE4b2xu?=
 =?utf-8?B?eXF4Q3hjanFubzNib3JUZHF1OVJOSmJVWTBzdENyRkFsQUpLWk91Ri90eXZK?=
 =?utf-8?B?UVMyV3FLRDZWWjEvMllGQ3hBUGV0MnVkSk5CZVhsaVRCSm5iYUhJYXRkdkFB?=
 =?utf-8?B?MkNYbGJHS3NaV21sS05wU2tKcDBqN3hqb2wvbnVRM1pXV2o0SllSK0tLYXVF?=
 =?utf-8?B?MjhtSGlKWjR4QnRVWmc1QmVqaDErOGs1Z2FVRFh4REprcEVrb2VuVGZPZk1r?=
 =?utf-8?B?VkkxVk11bXNDOU1ReFJPSkZRaFUxWnlUSkpzby8vSjkrLzBUREh1YVV3U3Q1?=
 =?utf-8?B?YVVpOHRtUCtGWXdqUDJIRHBCMnRMZ05hSFZQN2NLaU5MRDREajdKOTQzYkRj?=
 =?utf-8?B?MTQzU3JEWUxmaEFKV1IrRW9RMWtOZTBmUnBpVmhFY2RrTjh1dTBPdldnbkRO?=
 =?utf-8?B?OU9SWm1vTjhWRk1nYUdsTHVHbW54WTNSWkVydHdwSzhpOG9BWGZUdz09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 56fce9ed-bc6c-4287-fc06-08df472b7652
X-MS-Exchange-CrossTenant-AuthSource: VI2PR04MB11147.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 17:26:50.6116
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9WiZ6MtNn1r0ZUUsqFhCXy9okzcIP1H3MwK8GQRLfEUr5WW6ywK4Yr1+S80EDcnSfV5HDwmSw3/kRfuSTPjEgzlEJQCDeerU7N5LtS0aIGY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB11045
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <docs@lists.yoctoproject.org>; Fri, 20 Nov 2026 17:27:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10819

Hi Antonin,

On 10/28/26 9:04 AM, Antonin Godard via lists.yoctoproject.org wrote:
> To prepare for the sphinx-tags addition, update the container build
> scripts and add sphinx-tag, as well as sphinx-design which is a
> dependency of sphinx-tags.
> 

I was wondering why we need to make the dependency explicit if it's 
truly a dependency. It's only an *optional* dependency, hence why we 
need to explicitly install it, it'd have been nice to say that in the 
commit log and what we plan on using sphinx-design for.

Same remark for the Pipfile patch before. I would actually just squash 
patch 1 and 2 together as they really are for the same purpose. Possibly 
even patch 3 as 1+2 don't make sense without 3.

Cheers,
Quentin
