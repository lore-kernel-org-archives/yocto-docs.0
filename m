Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0E44CCF9EC
	for <webhook@archiver.kernel.org>; Mon, 27 Oct 2025 10:22:13 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.4])
 by mx.groups.io with SMTP id smtpd.web11.28503.1761560524462665618
 for <docs@lists.yoctoproject.org>;
 Mon, 27 Oct 2025 03:22:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=EwBs/k2I;
 spf=pass (domain: cherry.de, ip: 52.101.84.4, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ULXQ+GVmignZSDdKfnGPK3NIP9kJNEMWzjw1Lo97m/nvRzow8Z09x5nFhJvuZpb5ULzOnDjFKXNyLpZcL9il6xiT0QGDQ6fUSwJsFFgazAfyWX27Q8JhdCU0p+WoFPkc6IOqMQu3lXBLL5nwsZCAmTsgYaRqHeyvvqh/0NFXhPoqSxhPJINLCoOUYiLOVCfYoP1RFbulQG9yoFzoHPwlgwKrNtsYOqLRufuHsvf7nfvDfhQTNjSKEWc4AQI2nTn/RigZg3CMi2D+VWQm7ke4YZvShAPhAB+0YyToeNb3f5xAJT8lVvZCm8r78ZokBldastFpsG/RDAcbu/hYfM8yog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z45SSpyJuPaAgxFD7k2p5ENs25FxrYZpYS2vYPqgIfk=;
 b=aHLntgEScs7xDvSiDfiOjyIJWEUoaV3FgBOV1X/c0lNynaSFR2DUxoe4EbBWWJGWU7EN16XH2zyU3kLR35+MpxeanaItGvEKvybszaGFoTRd6VoQ/V1C+VvAzTH0on35Buz8NMdqhHaslIpTwzMYaF9Bk0NqtUTE+wehIyV4UBWDWgxa9d2I7AxJ1MuR1mHqq0gdof7p3nlaDMsxABw5POp/9ysWINytZsv6Fvtcoofj6numx36o7faOYjUgkOXnVXv1LF5zZ7wZY9B8I//2rJilL9naEGM5Ftegz7ZGew0127D4Hgg/cP9vVKoRGgE6ioc+phQHZmIZEzDn8uU2Rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z45SSpyJuPaAgxFD7k2p5ENs25FxrYZpYS2vYPqgIfk=;
 b=EwBs/k2IuSMNC6G7+BgasnzhqKNf5s4mN25HEHKEsRcxpPczdDRmBs0YezgT6AlXrLu0zLV4ZUvRvhinPlktaL11K6s8Hrt+iOV5f04KISfhGA8ctTgyD9fSR/Wrn6SRt1YUYAgu8xOh0pBqu8pAtkr3K3w9v+2K5Mcnpy53qCg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by PAXPR04MB8222.eurprd04.prod.outlook.com (2603:10a6:102:1bd::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Mon, 27 Oct
 2025 10:22:00 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1%6]) with mapi id 15.20.9253.017; Mon, 27 Oct 2025
 10:22:00 +0000
Message-ID: <3d69d9e0-9b6e-4746-b82e-eaf455010b2a@cherry.de>
Date: Mon, 27 Oct 2025 11:22:00 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] can you apply back quotes to something already tagged with
 ":ref:"??
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
References: <03001043-f0eb-c151-d69f-ffe409969902@crashcourse.ca>
 <5fbc6959-fad5-4889-bb5a-ca3e308bc6ee@cherry.de>
 <ab11b102-0a59-8b4e-7d15-844c7f89578a@crashcourse.ca>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <ab11b102-0a59-8b4e-7d15-844c7f89578a@crashcourse.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: BE1P281CA0321.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:87::18) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|PAXPR04MB8222:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e86770a-2eba-4296-d7cb-08de1542aa8e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?TXFlb3lZZWZ0bEdrTml1d1JFUzlqSVFDdFB1bVQxUVllNHhZcS8yYm1ZZC9M?=
 =?utf-8?B?NThZSzVaOFVHa2x3a1YzeU00WWFQbVNMcnhhbUNmdDFBWmc4YUV5SklJSGpu?=
 =?utf-8?B?aG0xRXM0MElzTURxaGsyTEgrdXZnWElhNi8wbmZCZmVlOFN4dDFGV0xDaXdG?=
 =?utf-8?B?bkpzSmZjbGVTeVFSTzlLeHVhOGpqSkEwNXdMUDF4NXU0NEQvSktqMmd5VzZM?=
 =?utf-8?B?Mmk3MkZmZWRLbWltOGRySWVGd052Q1RObi9iMm9yNjltekQwVUhnSWFmdXdK?=
 =?utf-8?B?N2ZLejNJZjVzakFTczRuUjBQTVd1V3llOXUydk9vTEhtRWJBSmcrRnhmTmJT?=
 =?utf-8?B?TkZYQ2hSSlJtUjV5b1Z4ZGRSTEpXZXJjbDdPNjBZTW55UXdEREFSOTA4THVa?=
 =?utf-8?B?T1VkcVdwUzN2YlBkZXErVTJBRXJDS1JkZFdCeExsOTJDWFdFQmhQc1VDaEkw?=
 =?utf-8?B?K2UzY2pvNXhPQXB6Q293cG9Jc09YeCtiS2sxYmlKVllpaUp6TTk4SmpsWUlW?=
 =?utf-8?B?RXhCVGhOZzhnSHRMMytqQVpEUWJMTkNkRWJ0eERRc2pJZFdJNXhLb2RBajRC?=
 =?utf-8?B?b1I5M1M5OENsdnN3bHFLT3VjaGhpbEk4MUNXUmRkbnN4VVcySDNHeldhdkw2?=
 =?utf-8?B?Ulc5cHRqSVp1NVFwN242TzdFbWw5SzJKOFpyaGY3d3BpUjRBWHl2dnN4anQz?=
 =?utf-8?B?OEpkTEFtSHFyK3dMTDFLdnp0Y1Q3SXFab2pqMDFGNWdWdWErOCtoQ2FvZC9n?=
 =?utf-8?B?NFpQM1U1KzhnR2FKRUxWd2Nlc2Q0RllXRnVGM3NvcElIYUpaMm1RK000REZQ?=
 =?utf-8?B?Q3IyNDBBWWM3RTArM2NiZUFPVlY2YklueEVUWXZxT3dDWlRQYnFFMGcrOERy?=
 =?utf-8?B?Z29objFxNnp4UEsyc3I5TFIreUh3MzhsMWhPcytRdFVKd2dnQklGdUVCWmQy?=
 =?utf-8?B?Z3pCWDZLUkg0a3RVdlZ2Nm1JSTZMZmxNTFhwc1czM2doRlNJZjBXbktRNkxl?=
 =?utf-8?B?MnhRMDNtZ0tUTytPOU1XYUNWWnU2c0FOck81dVp5VDRuQVNkb3VWOWVvc0k2?=
 =?utf-8?B?SlhpWHYyY0pMaHprK3U5QnJVMGRlK1h0eGFlTTJMYVp3enRISGFUdTZEUGhV?=
 =?utf-8?B?WE84b29Lc3pwZ3dPMERGZHgrcEk0UjBVUUJGOEZMczE0NWtiTC9RZ3J0a3or?=
 =?utf-8?B?Ty9kYkJPRkFrMHFZaFdCS1JlQ1dVL3I0SEhRRnhtN1BLN21RYlB0bXU5dmIz?=
 =?utf-8?B?aGNxM3FIcHpCR0d6UWxWbWprZW5LU1BXVXhrUWpvaWg0clFNa0NZZWxpQWpH?=
 =?utf-8?B?ZkgybkNwd0FEdjBkNkh5RDhUYk1kMXJLb3A3ZjVkUExVRDVFdmdJbmduNVFR?=
 =?utf-8?B?MFlyU2VUM1VQSlFHbjczaUs3VHVpOVN4RTF3MVFNUm9kdUNvcm9xUzVyVEl4?=
 =?utf-8?B?MDZScHZ0WUN4Q0hkcnZ2cGp6SVFOd09LTTluWUd4SnZzTm1UeXptWTdqdVhp?=
 =?utf-8?B?aVkvdmxOaHE4dWluekgrSDVvQUhDNFR2TUlwd2t3VnZSLzFxMythcVFZRkVY?=
 =?utf-8?B?SWRTMXZHeVB5ai8yZnNCSWF5Vjg4TXBGS0Y4ZFFERExWcWlNNDlqTlJpck93?=
 =?utf-8?B?OHFmWUg2U1JNajcrcjhZNFUyaWk3WDNsc1V4VjhpTFpnLy9RczNvRUVmR0VJ?=
 =?utf-8?B?UG9ucS9Fbjk0c0V0U1VqOWpGMVZQU1kxTGhneUE5UWlJTjNIVGhLZC9FbGV1?=
 =?utf-8?B?YWNqVkhjNEEvTkFRbHRLZnZ1Sm5lZWIyaE1mWFVHYjlEeWFmdkJOa3oxR01U?=
 =?utf-8?B?NHFEdVhjN3dKNERCb3gwR1JQR1cwRlhCc0hBUkcrNTc5Y0hra3JyTkxLQngw?=
 =?utf-8?B?U3NXWVNKOFlwUkpGNGpvYzBOQmdyNTUyK0xVSDZqQWJydWc9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?czVCS0ZxTHBZVEZEeG1qc0FUWitueWhEKzhiN0dsQmJQbTVHN2ZCUVFBelJ5?=
 =?utf-8?B?cXVqaWFjUVBDdXM4TXJZSzFHY3gxbkpDdjJheHBLOEVEdFlVdzdFK2dQUTJ4?=
 =?utf-8?B?bmhFaStwUGZFR2JHMmxkd0JaTkVOOUtUUnRpV1NJci8vQ3UxK0o2NDQvRFlJ?=
 =?utf-8?B?ZmluVisxeFRJR0JXSERPSkQ0YjdCTXlsSEVFTzU4MmdLYTVHZ0Q1OHlJQThP?=
 =?utf-8?B?RVBBTm5qOXFXWFBLK1I4cyt6SHZiTVRKcW5QeVJSMzV0S1lPRUQwNnNLN3N4?=
 =?utf-8?B?cTBRekQ3OW5QLytHWktXWG5VY2ZJdzZSWEg3UUkwOUhxMWJZME9adC9zejFC?=
 =?utf-8?B?OVVEZ1crVnFYUVZjSUhrb05aTWtIVlE0QWFlcVEwL2VFZkJSN3k0cURhamlY?=
 =?utf-8?B?OE9DamF1QVBRL01NM3hLR3FxaEJsZGxNaGFhT1VRM3BrMjh5a1l4VlJ6bXZW?=
 =?utf-8?B?TEJvNUVUdUwvNmxFd2JxL3N3RERqYWxjbnhweEJranNPdEpieFZzYWJQUWM0?=
 =?utf-8?B?eXdOb0FoQjBzSUpuWWF1RjRJd1gyZXFTNE1Pb1plWWo5d3BVck80ZHZwM3ky?=
 =?utf-8?B?L2E3WDBPakRrVENwWTRNUGE0dEh3SjBrRkF2MTF1dEdmNjFoMDlTSDh2cVNZ?=
 =?utf-8?B?d0JNY3daZlJDNVowekxrY1hUZHo2cElWc0w1bTdTV2pWN3ZLaEszcXZMOWs5?=
 =?utf-8?B?ckZFdm9QZ2VITWxaNGtFNlMvZlh5TTI0YVV0ZEx3YVYxRHBrZzVIWERQODg5?=
 =?utf-8?B?SEg3WnREVnRCYVRHSlU0dHM2MEhVekFDRkVRVTdwa3daY2hZRWhscVJmMGx0?=
 =?utf-8?B?ZWtrL0xaQXhLcm9YTWdyUEoxSUM0bjEyMEx1a01IUGY0eUxoZDVOTEkwK1NI?=
 =?utf-8?B?U1RDQWtJUnlOOUlaMmFEd3g0M0VqMDNsR2o4V09PakpJZlZBdDVFK2RKNFdx?=
 =?utf-8?B?OEVEUmRsdndUamswSzVnSmVCSksyRUF3RWEwcEtKQ0E4N2lVZGpSVTdBK1Yv?=
 =?utf-8?B?SlNVNmlvVjdtM0lyL3lvSjlId0RNNTN2eWNNZUxsU0pheTNxb0tyMkdmVXgz?=
 =?utf-8?B?K2xPRVhTdzRUMnZ2MEU4QW90ZHBRSVc2UEx2YXVMUlJ1VFN2c1NTWWxNcVF0?=
 =?utf-8?B?QUp6bStjVnU4OFUrSERSZWxkb3dyVkQ0TkxFZ2I2ZTVEaURqMUdOeEc1UXNz?=
 =?utf-8?B?aWFWYzB0MjhqUTRpNEdDMjZnd1QybGVqLzhuZmFRZGdpZ04rbVBtZ0p0ZDBJ?=
 =?utf-8?B?akg1L3pQb3ZwVTJ3L1lDYk0zcVBIYUN6emV3Wm1Cdm9uV3FldFRoczBmN0F5?=
 =?utf-8?B?bkZFZDg0c3Brem5rVUtkQlZ2TllSVGxkcW1FNGRXWSsyWjBabFZUak9GcTRl?=
 =?utf-8?B?dmFkb1pOWnE2cUorb0VmMTFSVVhFcGcrdlZYa1VRRlEySFByN0toaURLZEVR?=
 =?utf-8?B?cTVkaHhqelA3ZWFhQUZvUGZQU0FIU3ljWnpnaElqVERsT0F6dXhvcXg0M0dB?=
 =?utf-8?B?emIrSjRyTFBHSkpLaHlPT1ViQUo4Sk02VW9MdXdiUFA3N0JNUlhrRXBQRTla?=
 =?utf-8?B?MU9OcUJiUHVJVjdSbmVFaXZ0Q2xJTk5kUVBuWk1ZQVVwS1ZXVTgyOFRrR1BZ?=
 =?utf-8?B?eGVqa3hsU0luZDdtNmtZSlZkZ3haNGxpd1ZBTHd0dGNWOWIrNWdsNTNkWHNo?=
 =?utf-8?B?MVFXdXRiNHNUenh4TnYvNXJDTHRoSHpTZ2VQWm1jZklZSTRvbFJ4cHBFUXJO?=
 =?utf-8?B?R1ZGL2dTOTNXdE43a05ZeHlWclptOFhGNXFwb3FwSzJBb09qM3hLWFE3dURX?=
 =?utf-8?B?Z2M2aDhhMFIwN1Zkek8wS2hQNjJnTm1Sb1VvL3BxbmtDZkpYK2ErRjJ1YXJt?=
 =?utf-8?B?TlpwWUVaS3dzdHltbWNGWjF6UjIyWGJoOEcrSnFLd3NWR2V2bTVYNEY2ZEdF?=
 =?utf-8?B?eXVOUTlqbVBFelZ3NFJVcUJJOHdTMVhGOXdIWFdTMW12VmRBUHFzalJoczdt?=
 =?utf-8?B?TUVxQjF5OWxaYlBaMjluQUUyVlVucnc4OHk2cnBVZWhOT3FzYS9GeE1JQlFT?=
 =?utf-8?B?ZlVQNm80RDIzbVk5VG5SdzhhQlgvRk1Bc3JVUUJGMWtDb250V1ZvWFEzZm5x?=
 =?utf-8?B?TmpzUGQ1ZlpUeFpvZUNQeElBamdheGVPL2ZjRi9ZbXFGRVJscjNFMWtPMnFS?=
 =?utf-8?B?d0E9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e86770a-2eba-4296-d7cb-08de1542aa8e
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2025 10:22:00.8057
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /eRkq7xC7Vr161COGoD7tZrIbxJ6WYXeI6ZLHuSFliSxJxSj2OwI9T9dEYUkkxZ+1M/436T5Gbg2SDIuRdw2Bp1dnHUZm4xf/w0G0kAy+vY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8222
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 27 Oct 2025 10:22:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7845

On 10/27/25 11:11 AM, Robert P. J. Day wrote:
> On Mon, 27 Oct 2025, Quentin Schulz wrote:
> 
>> Hi Robert,
>>
>> On 10/25/25 12:07 PM, Robert P. J. Day via lists.yoctoproject.org wrote:
>>>
>>>     just noticed the following in dev manual, "layers" chapter, where it
>>> *appears* that someone is trying to render as monospaced the utility
>>> name 'bitbake-layers' inside that ":ref:"
>>>
>>>      layer-creation tools, see the
>>>      ":ref:`bsp-guide/bsp:creating a new bsp layer using the
>>> \`\`bitbake-layers\`\` script`"
>>>      section in the Yocto Project Board Support Package (BSP) Developer's
>>>      Guide and the ":ref:`dev-manual/layers:creating a general layer using
>>> the \`\`bitbake-layers\`\` script`"
>>>      section further down in this manual.
>>>
>>> Notice the backslash escaping of back quotes that suggest this is an
>>> attempt to render as monospaced, but that doesn't seem to do that, as
>>> you can see:
>>>
>>> https://docs.yoctoproject.org/dev-manual/layers.html#creating-your-own-layer
>>>
>>> or is that trying to do something different?
>>>
>>
>> https://docs.yoctoproject.org/bsp-guide/bsp.html#creating-a-new-bsp-layer-using-the-bitbake-layers-script
>> (source code
>> https://git.yoctoproject.org/yocto-docs/tree/documentation/bsp-guide/bsp.rst#n1145)
>>
>> Remove the escaping backslashes and try to build:
>>
>> /yocto-docs/documentation/dev-manual/layers.rst:19: WARNING: undefined label:
>> 'bsp-guide/bsp:creating a new bsp layer using the ``bitbake-layers`'
>>
>> If you remove the tick quotes entirely:
>> /yocto-docs/documentation/dev-manual/layers.rst:19: WARNING: undefined label:
>> 'bsp-guide/bsp:creating a new bsp layer using the bitbake-layers script'
>>
>> The title contains tick quotes and it'll be found by the cross-referencer only
>> if we pass the link with the tick quotes. They need to be escaped though
>> otherwise they don't work as evidenced above. Having it render as the title
>> would be nice but that isn't the reason.
> 
>    yeah, i followed up my original post with a "mea culpa" that i
> figured out what was going on.
> 

Yeah and for some reason it's not the first time the mails you answer to 
yourself do not group themselves in my mail client so I only saw it 
afterwards. Weirdly, the archive doesn't have the original mail, c.f. 
https://lore.kernel.org/yocto-docs/423be681-9172-dd14-1c69-d7dd8d2e32d1@crashcourse.ca/T/#u

I have seen a few other contributors have this issue as well, I'm not 
sure what triggers it.

Cheers,
Quentin

