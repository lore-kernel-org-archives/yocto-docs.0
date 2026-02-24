Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DCA2F3C991
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 15:30:14 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.22939.1771947006495010794
 for <docs@lists.yoctoproject.org>;
 Tue, 24 Feb 2026 07:30:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=Ssaavdjk;
 spf=pass (domain: cherry.de, ip: 40.107.130.43, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oKHU1KDwjsp4TTOyxbBWR8T6z1Z2mBQAsPLDO87LBQOdcB1NfT/mYItQ6E101mrwWicxNPq8EYoXDtBWAc4/Y9tLAZyPNnLb7GFAloqPiD8v0jwOFTnYezWM5S1zUFwnFK4wlbd6Bjy8Hr0nAxDc/W/e4s60y41ffJyAnhwbHLtsEFnW9YXyjNb5Y9Cakqxg75V9SUiM+LvBV489jZ9xxaJp1cBsOyjJZE1OYAg3gR9ZnTg6rReMQS/fjpB4eKPiplrwO+DB/riH+5pn/bwUuUYhUJfLAKO6Z/XfmSlByOq85Noo9uPXPZKluQFku+YJ99vTmfDIeiomcMfrUMIjbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V4RfjIGjGuT2xUwhfd9PrfyJ9mCn7dce+rMx8D53tjs=;
 b=My4AQ/mqBxitYaaqz4FZYwgQgiermfx5yKXRJguGY/Uj7L1a5gHm9HEPYVTq3YbBIUE39aghuh6Y6sL90ZusB9QiTAgCXc8V6feuVmxGOBzBH7yMtcObNkyd6GUHWl/2briDBU1EFGy8Kdm+LgHCFnrHZxe6fl8nAUCinwNRBu724hFDF8Xl8MOr/HKpTPadOVeTHcUKArW1RKGIkRZP7O9tm2OrecuYA9U7TIw1GnANfo+mjiXqPn2TZB0atg4RJDBbpm6ZKyGZNvB96f4+uuHeRviRyXvtGRZhaEK7cUdZ8y94UAlmMNUbctkTwIRNNDlWqWdMzWLW4hwp1rY6BA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V4RfjIGjGuT2xUwhfd9PrfyJ9mCn7dce+rMx8D53tjs=;
 b=SsaavdjkfBYXDkhWgqn3G6IZUVh5vpnacGgbq1Rf1qkITyrDrAw2B/T9EuDL1tgtV/dZHORhMCilo+EIrWQ2/eLSw5a4jpvLd8zl4PUokF1EMtZZKGyW2bZtftou8ik6zjiudoV2TMDHlCg1GbBCMp9zh3IK/5dL+z4HpwYXUWw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by PAWPR04MB9862.eurprd04.prod.outlook.com (2603:10a6:102:391::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Tue, 24 Feb
 2026 15:30:01 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78%6]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 15:30:01 +0000
Message-ID: <e1e4d98d-caf4-490a-b138-76cfd97f98ed@cherry.de>
Date: Tue, 24 Feb 2026 16:29:58 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH] variables.rst: expand explanation of RSUGGESTS
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: antonin.godard@bootlin.com,
 YP docs mailing list <docs@lists.yoctoproject.org>
References: <1ee12fbd-a5c7-7b14-a558-cd6dda9e539e@crashcourse.ca>
 <DGN78E65FUWN.2BTR1KCHXV2VN@bootlin.com>
 <1b69d976-4159-354d-a283-bd06bedef3b7@crashcourse.ca>
 <f336c43c-c7e7-4f6d-88e0-c5cc79f26b77@cherry.de>
 <91e83bdb-d111-db18-73a5-31cb8f06050b@crashcourse.ca>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <91e83bdb-d111-db18-73a5-31cb8f06050b@crashcourse.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: FR3P281CA0141.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:95::14) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|PAWPR04MB9862:EE_
X-MS-Office365-Filtering-Correlation-Id: 068d7014-f0f3-4d26-3df4-08de73b9935e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|10070799003|376014|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?MzhycXhNS1dvOU1VdytuZjIxa1JQUWduQk5qSHNjRENYVUhiUWlPQjZ6VS9h?=
 =?utf-8?B?YW9WWlJadmhqOUExY2RLbVREd25ZampSWERialNsMXBWZXZkTnFzOFN5KzJu?=
 =?utf-8?B?SjFzckc1dHZwcERBWWRocThtWGtGakJ1SElkNXlNOGtJcjVpQUtQbGNHd1NN?=
 =?utf-8?B?eUJjcnV4V0ZQVWlhWXlaWmloUExqK3NxNnUyUmp2czY1SUQwZ3BVYVFtdEdZ?=
 =?utf-8?B?ZUkvaHRIREdwalRzSUR4QkpZUWRUdHppNG1NVW9Cb3EvT25SSVhzTE9XQjRz?=
 =?utf-8?B?dG9ZTzY0MGF1T2RBZm5PUHdPVGR1K3pBZWJ1LzB6cFlVTjNSL3dKUUcrSjRy?=
 =?utf-8?B?bHVhRHVQckoxWVpKREdrWDlOTFNLVndlcXBZYzZIc1ZrRGVUMTExTU5ZeTNn?=
 =?utf-8?B?ZTlvK2lCTXJuTTcxL1JaNWMxTzM5SElnOHlndVJPYUVZTjZ6NndOT2ZTZUZT?=
 =?utf-8?B?WHluY29RcnJyMXdDMWNLc2RJYkdvOW5DQVVmKzJFV1dmaXoySGNnV0h4bU0x?=
 =?utf-8?B?S0Z0K0l6anJianJON3AxMXhENWJvSXJ4Y2ZveWZ1NEdTdDUwUnJXWFdPdkky?=
 =?utf-8?B?VThVdzZqSEZmTkRyRUs4c3hQay9hVkt6ZGZnRXJENnJKcDlzd3VMd2dnUnRo?=
 =?utf-8?B?M1N5ZzFoWU81MURqQ08yOUJ2dVRCVXo3RnZXdXFFajM5RnBCaFphaVNhaXJk?=
 =?utf-8?B?T2NUV0ovUTl0L0l5bUF5QlNQU2xQclI2TTFxa1QzcXhCK2JEQ0t6VjFMQXJK?=
 =?utf-8?B?QkdnN2R6WlNIMzRBelU2ZmEwZHlnU0hyZnpzR3hYdHRkZCtwSmYxQ0J5dzA3?=
 =?utf-8?B?WG5ZLy8wMWIvMkZ0UHlyVW5nU3NLaFhBeGRLSXBJblFROUVLeFNkamtWZm5Z?=
 =?utf-8?B?N0JaYWQ0RlRjR3JmWjl3LzVGM3dQVG5PRlhnRUQ4OUd2bEhCRHkvVmhqbmpU?=
 =?utf-8?B?Tmg4NzdXQlF0MlhBVW9WNzFEOE1QMlNHR0lRamIrY2VQOUpnNlFRSDF0emlq?=
 =?utf-8?B?dkdZUlRZZjdVZ1A3OUVJRGVaMVBxTDY3NUtFOUp3M1k1NVYxK2pWeXA0b0NK?=
 =?utf-8?B?VDZDTkozUjh0MVZ3eGJiVTYwSDgzWnhrbXpDRXpnbmFpbmgxM3J4ZjY4dDY5?=
 =?utf-8?B?M0Z4dW8rODdMaExFQmRyQjJqTDBBdGxtU1Fub3BaWW5XdmNpSDdGTWNaWWt5?=
 =?utf-8?B?Vm1VdEVqUGRybGNZWGZCYXd1VjA5WjJQamlXQmZ1NU0xL3MzeDNiQ2E3VTg0?=
 =?utf-8?B?alhHVkNWclh4eitGZjZSZG9LWFFyNG9XWURrc2RjWFAreU9oc2pvNkt3bEFn?=
 =?utf-8?B?Uml1alBydllMM0NCbkREenNvVEtHaWNaM1BNRzIvLzFkMFdQME4yVGRHSEwy?=
 =?utf-8?B?djNsNnpQb0UzLzlLMnJ3SGFCeHl1UTQ2N05RMFFpQ0dvTGFkZ1pCQWIzdFM5?=
 =?utf-8?B?Q3VsdmU5VVBaTk91dTRrU1Q0a0oxcU5nRnJ4a3BPSlFueCt3eHRsdk45K0hv?=
 =?utf-8?B?UUFhdFkzZE1Ea2tKNUdvN0FzZEJubC9tZWFxOVEwK290VnlmWnVZQVhHcGRI?=
 =?utf-8?B?RXFJNGsxZy8zRGExTTR4aVlyRlI5NCt6TWc5TmxGTXdxYXd4eWpYMnc2ajhE?=
 =?utf-8?B?RWdlaGdyZ2tNR1VlWmVvUWZrY1R6R05HbHVYQitWUEZJck5adkZ1ZnI0Z211?=
 =?utf-8?B?MXBlRXZ1TENzZXdEUXpwRzd3OHY4YWdmTmJ3REQyZ3FoTnpSL3oyVXVvTGlN?=
 =?utf-8?B?cmFjNTJXWG1CR1dyY0FxUVN1L3BoMGI2VmFEblhWTWlqTG5IU2tvS1ZOc2t4?=
 =?utf-8?B?bnc2SHFTcDByYnYvMmg5Ykl3YURHNitSTTlrYTN2Y295Y1g3UnI4M1NTdGpa?=
 =?utf-8?B?ME0vYkZuT2o1QzIzSTNCZjAwODJRNkZMTEJQMzNpbUIxbi9mbExXRVMzTFZh?=
 =?utf-8?B?L1hsNDZvcFJ3WFJYTnFCWU9laUJ6M0o3aHZCQVF5R0JEam1DUWc5ZHVCTXFN?=
 =?utf-8?B?WWUrN3JuV29FM3J4WHJjSjI5bkJTak05VnpMZmZWWHo3K3RUK2J3VUFLSVl0?=
 =?utf-8?Q?uEXJ1v?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(10070799003)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?M3lPSWlidjBMV1BxWHcxS3lLTm52V1MvVmQxd1lFazMzcjF1U2hudDU0UzFp?=
 =?utf-8?B?bDhGNEJSMkJ4S1E3bWpDOHY4c3JWVmgvWGJFZHBwdFM0OWh1Q3JlK0ZRV1cy?=
 =?utf-8?B?Z3ZMd0lDcVpieUwreHluVG9sdXBEbktSdmpzTS9nUStEZXJRT1YyTGQwVW9G?=
 =?utf-8?B?VUVacGdnaWNqRVJRVnhDTmFpdUNzb2pLcDg0Sko2QXhQVDR1Qko5b0M4OHJ3?=
 =?utf-8?B?Q2pLSG1Odk8xOG9Sbmw4RkpvT212K2Nwd3pKUXBOQXVPcnRlOXdwaUI4VmE4?=
 =?utf-8?B?NWtNQytqSTFMNERVOUZYYnhMNzlNbGttS0xsY0kzQTFIZEttemR2NkQxWFdC?=
 =?utf-8?B?T0srYWptQmt1ZVo1dUp5aWluMW8xS3VPWlVuQyt6dFpLUDA2N3o5R0tnZ0Nl?=
 =?utf-8?B?Z2xBRk9yMGhlL0lkTGFrQ3BBdUJsMW9ybkp4WlpoaFB2MWt5NUxNNXpZUUo5?=
 =?utf-8?B?alJNSy9rNmVzb0lhNlNhR25CUGhTRWVubU5EZ2cxMHQ2UmUvTDBhMGZkdHgw?=
 =?utf-8?B?NDUxdWd4WFZmVmwrM0JFU2tYSGRXTk1vYzRtb29RRnZLcDRXdW5FUHNnUW9N?=
 =?utf-8?B?K2kzQ1Y2amhHL0JtNytVNU1VSjlNUTh0WE5nYUNja29vc2tvWmFTaW5JZnZQ?=
 =?utf-8?B?Q1dZdWNmK3VuOTd5aDRJRmIzcGtFeFVzaTVPUUZ2TC95SVRhYnczRU53a1Ri?=
 =?utf-8?B?MDdQVEtrazVaSWlsMEVpT0FRNnQ1MExIdDFzWC9XOW9KRG5lWmVUOFZ1K1Y1?=
 =?utf-8?B?ZFdjRUJ1Znlua3BVU2pXc2JsaFRmalJoRlBXRWMzaWNNTkFGdHYvdWNEc2sx?=
 =?utf-8?B?ME5Lems2RE1EaUw1ek9STks2bVB3UXdlbEI3RGFYTkV4aDUweWV6UFZQYTQ5?=
 =?utf-8?B?TVBPSnNna1hNTlBsSXlJamdRc3F3SGNOMXR0bU5HdE1YeWhDNE4xRXZhUGNT?=
 =?utf-8?B?RldBTlRVYU1LTlZoaFNnT29kRHdJeGNIQ21jb2c5VGFtaXBJMnBiQnVxNHNm?=
 =?utf-8?B?b2Y1MUNSVGkzZGJTTjJNMU9lZmlURk1MbWZKZ21lbDBVL21jNzF6RUlNR2ps?=
 =?utf-8?B?djlNYzVTYlQrdzh6L2RpeHg2YXhKUi82OVRFRDBGT0I2VE9PSmwrODNndWJB?=
 =?utf-8?B?alF2UDJEdmpVeXRnOENXYnByWlJVemZvNDdyM3NrN1lYem1lNytEaHIvWlhY?=
 =?utf-8?B?aHRKNjREUFhiQmNDdXZmOVVJYnBjQWt2dnBVb0N2a0Yva2VCT24zZ2pwbE1s?=
 =?utf-8?B?VzMwZjI2eUZrTExoSVg1Rkp4NnkrZE5yOUdXYWxXdEZKSHZzOXM5QmZHNlJ5?=
 =?utf-8?B?cmZCY1NUTk8rb2wrMi9tTk9YMlZEN3dMNnRDRWQ3Sk1PVXdpRUhNY1Zidmpw?=
 =?utf-8?B?T2dGSGJ5Tnh1OS8wODNCTTgrdEFaNlQzaXpOc0R3WGIwUlFSWVJueU1hd0k4?=
 =?utf-8?B?QWNSYmkrZHN6ZHk3OHkxMTRHQ24rY3llejFGOVkvVG16aFRueFd5dUtiL1Jx?=
 =?utf-8?B?VGU0c1dCa0lHWWdkUkMvdEJ5a1ZZN3NoYS81VlozdHI0WDZnbVZLQ3BFZnA5?=
 =?utf-8?B?VVBaS0VBdzh3TmlwcGRXaUhqMjZQemN5T2FtTi8vNVVoSEVZZ1V2SUR4cm55?=
 =?utf-8?B?d0VubnhNb3lmVDgvUUNTaWNUdm8reWxFNjMyanJ3M2wrS2FaTlhFaDBwZjZy?=
 =?utf-8?B?NFppVDNuMzFsbnJxU0R1cmNJeDhQNGtOR205dnd0cnkvZEkxZ2FnMFVPdXUw?=
 =?utf-8?B?Q2U3bEZyMGJOZUswYzI4aWlVZitMVXRRcEFBWmJtL0h6bkRteXZscVhBNkVV?=
 =?utf-8?B?YVRETXpSWGZGTStTQWx4enNlMTBETkw2cXYyemdyMXJXejlhelNDV01keUwr?=
 =?utf-8?B?bitlM09CUDRZd0xUdWU4dnZGbWN1YmN2ZlBmb2R6d1Z4ckNnRW94RVpGWTFq?=
 =?utf-8?B?Q2VKTEZmVHdBUDNOVE9Yb29CM2tkSlJNeEMwbk1ZWllNWDVlU1E0Zk5GYzB0?=
 =?utf-8?B?SHJ6M01QYVVpdERJV3E2TkhyOXlOL1E1OG1NUzJwMU5va1I2Vzl0UjhJRmVx?=
 =?utf-8?B?UkVJMFhRWFFaeERUZ0RFelcrNGt0aDdScFZwVFBoRkptbUw5WElMN2t4bmdJ?=
 =?utf-8?B?cE12WEhHSDAxRFhoZC9DNFR0ODhKWlBKVmw3VUFTUllYM0JjSGhTTGNDZFhh?=
 =?utf-8?B?cDFYcjhXRVQ1QkRBbGtCVkVlSUREQ05LQUFXb01oOVJvbnpNNjBGdW9DNlRM?=
 =?utf-8?B?cnVPKzZnUGFUTDlEYkJSRFdoN3FDLzBkZG9sYjlGTEdLU3RzeGcyakVFUnVr?=
 =?utf-8?B?WU0zelVXUEI5QXVVc3dmL2xpMjBGbEc0ZGRiSTF2Z2lsdkNQQThhbVN1dkoy?=
 =?utf-8?Q?xZ8x5+HlI+j+hpHVYcTBuEmYFtyt8BbZ7chdA?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 068d7014-f0f3-4d26-3df4-08de73b9935e
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 15:30:01.2700
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lfxro5eBHhkNonqOnSWIznY6o5Qb+W+OUr6h3GkUfgNV/Y8KFc1m45HEa1+VSANrWHwNvKx6owFUaFYwWtIbV91JsvF6YERMi22Jv0o0DOc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB9862
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 24 Feb 2026 15:30:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8976

Hi Robert,

On 2/24/26 4:26 PM, Robert P. J. Day wrote:
> On Tue, 24 Feb 2026, Quentin Schulz wrote:
> 
>> Hi Robert,
>>
>> On 2/24/26 1:55 PM, Robert P. J. Day via lists.yoctoproject.org wrote:
>>> On Tue, 24 Feb 2026, Antonin Godard via lists.yoctoproject.org wrote:
>>>
>>>> Hi,
>>>>
>>>> On Tue Feb 24, 2026 at 1:15 PM CET, Robert P. J. Day wrote:
>>>>>
>>>>> Add that the RSUGGESTS variable would be processed only by a
>>>>> supporting package manager when installing packages from a
>>>>> package feed.
>>>>>
>>>>> Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
>>>>>
>>>>> ---
>>>>>
>>>>> diff --git a/documentation/ref-manual/variables.rst
>>>>> b/documentation/ref-manual/variables.rst
>>>>> index 208b5e43d..92476d509 100644
>>>>> --- a/documentation/ref-manual/variables.rst
>>>>> +++ b/documentation/ref-manual/variables.rst
>>>>> @@ -8361,7 +8361,9 @@ system and gives an overview of their function and
>>>>> contents.
>>>>>       :term:`RSUGGESTS`
>>>>>          A list of additional packages that you can suggest for
>>>>> installation
>>>>>          by the package manager at the time a package is installed. Not
>>>>> all
>>>>> -      package managers support this functionality.
>>>>> +      package managers support this functionality. This feature takes
>>>>> effect
>>>>> +      only when the package manager is being used to install packages
>>>>> on
>>>>> +      the target system from a package feed.
>>>>
>>>> Could you add a link to the section explaining how to enable this?
>>>>
>>>> """
>>>> See the :ref:`dev-manual/packages:Using Runtime Package Management`
>>>> section of
>>>> the Yocto Project Development Tasks Manual for more information on the
>>>> package management feature.
>>>> """
>>>
>>>     oh, man, did this just open up a can of worms. if you check that
>>> section:
>>>
>>> https://docs.yoctoproject.org/dev-manual/packages.html#using-runtime-package-management
>>>
>>> it has no reference to RSUGGESTS, so sending readers there might be
>>> less than useful. so should some explanation of RSUGGESTS be added
>>> there to provide context?
>>>
>>>     and when i scroll to the top of that chapter:
>>>
>>> https://docs.yoctoproject.org/dev-manual/packages.html#
>>>
>>> the first section, "Excluding Package from an Image", mentions
>>> PACKAGE_EXCLUDE, but does not mention using IMAGE_INSTALL:remove,
>>
>> IMAGE_INSTALL:remove is *almost* always wrong.
>>
>> This only has an impact if the package is explicitly listed in IMAGE_INSTALL
>> variable. If that is the case, then instead of using :remove, simply do not
>> add it to IMAGE_INSTALL in the first place. If it's not in IMAGE_INSTALL,
>> using :remove will be a no-op.
>>
>> If the package is brought in as a dependency, you need to remove whatever
>> package you explicitly list in IMAGE_INSTALL that is bringing this package as
>> a dependency, which may not be possible without rebuilding the recipe with
>> different PACKAGECONFIG for example.
>>
>> If it's brought in as a light dependency (read RRECOMMENDS), then
>> BAD_RECOMMENDATIONS or NO_RECOMMENDATIONS should do the trick.
>>
>> PACKAGE_EXCLUDE will prevent building and then you can easily figure out which
>> packages that are to be installed in your image depend on the package you want
>> to exclude from your image. This is a good starting point to start debugging.
>>
>>> which is definitely used in places i've run across. should that also
>>> be mentioned as a way to exclude packages?
>>>
>>
>> Hard no from me. See above why I think it is a bad idea to tell people to do
>> that. Maybe we should actually explain why this is a bad idea as I see this
>> being repeated here and there.
> 
>    so would it be sufficient to simply add a note here:
> 
> https://docs.yoctoproject.org/dev-manual/packages.html#excluding-packages-from-an-image
> 
> stating that, while "IMAGE_INSTALL:remove" is occasionally seen as a
> way to omit a package from installation, this is almost always a bad
> idea and that "PACKAGE_EXCLUDE" is the proper way?
> 
>    that at least would warn developers off.
> 

A bit more info than that (see my initial mail), but I think it makes 
sense indeed.

Quentin

