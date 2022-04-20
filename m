Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4F01C63703
	for <webhook@archiver.kernel.org>; Thu, 21 Apr 2022 16:46:08 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.49])
 by mx.groups.io with SMTP id smtpd.web10.8638.1650466621846767358
 for <docs@lists.yoctoproject.org>;
 Wed, 20 Apr 2022 07:57:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherrycloud.onmicrosoft.com
 header.s=selector2-cherrycloud-onmicrosoft-com header.b=lHRiUWom;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.6.49,
 mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cqIc3jA7v10l53MLas7qPEs8q3w71ZlB37DFLwJwzcK1Z+HEQrmCy6nMeaBE4Dk1S9kmlVNLnWJvn2cZwkDGsLyHWvTeSG82ruM6Qf/WkFoa/LIU4b407F726BWY0RbCeSJcn9yJ00j3uumvfQzcI9hjelw6lF2RDVD+ritrVR0Qgvz9xheFzy23t/IFS8YYIzgANWZhGtOdf3kbUEvg2oEqO28FMA8XKJ5yVpBNKcmMusDoAKMmKY6JwizYrSKeDSy3HfIBUM5ibuPRGeuEmIhqDtjCIcSjdv42Ut2bQZN8Pz8Lcw4LPYNRmH/rKXegDX/aF37kEe+6y6IyFPJIew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zf0NA4vVC4fIOSCSZkjXGUDdTr5wNXt3QLyKdobwKt0=;
 b=JHktwOettewiIw1msrwTPCCyWDBe4kGGph5/rvyd1z3EOtEvh2c15igsbskyTsUQwrJFffxTp1dkn87yvnWjiKYSYuJVKRUJXjp9AlH8AVAsYQnGrNmZTfo1irTKVHDi0aHr4UuUtBreiqyB5X+fWquN3YtJoyIzvVI0p1mJ8fNxgh6ivUbSwcIJ2SP4e3xrKnMlHy60TE9pWtTjYtRU7+OhFlJZG5ayxc6CdwDiidQt7hu1aTGliRK8TfXXTfQuv0mYcvTBi7SF20N41bgdfu/9FEXBvrbKzJajnLi0Nss/3+m1hXg/kgOqHfHzySrKFWlzGFGZvqN060RDcFVW8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zf0NA4vVC4fIOSCSZkjXGUDdTr5wNXt3QLyKdobwKt0=;
 b=lHRiUWomr6kqkb4OafdmmIX2Xj0jlc+9JVkaTq6IH5PlU7D7ziPrNRdfoDGJfiPCgkYUcNqALBKc9VTU2X8vYsR5onTBNNmXaDTKFXxQJ0xmD/I6noTVZFAiLAfQd7TYoQGvMqIezKmikygJI7hZIl+JQCYlozrFlay6mLGax2E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com (2603:10a6:102:2aa::7)
 by AM5PR0402MB2705.eurprd04.prod.outlook.com (2603:10a6:203:96::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.13; Wed, 20 Apr
 2022 14:56:57 +0000
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::e448:c9d3:fa5b:2979]) by PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::e448:c9d3:fa5b:2979%4]) with mapi id 15.20.5186.014; Wed, 20 Apr 2022
 14:56:57 +0000
Message-ID: <8b6ef4a8-3872-2151-cb98-c50b3b75bac4@theobroma-systems.com>
Date: Wed, 20 Apr 2022 16:56:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [docs] [PATCH 3/3] docs: sphinx-static: switchers.js.in: fix
 broken switcher for branches
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 docs@lists.yoctoproject.org
Cc: Quentin Schulz <foss+yocto@0leil.net>
References: <20220420112402.151968-1-foss+yocto@0leil.net>
 <20220420112402.151968-3-foss+yocto@0leil.net>
 <1fe08f0546054257ab5849c316eebf25ac918e84.camel@linuxfoundation.org>
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: 
 <1fe08f0546054257ab5849c316eebf25ac918e84.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR06CA0120.eurprd06.prod.outlook.com
 (2603:10a6:803:8c::49) To PA4PR04MB9367.eurprd04.prod.outlook.com
 (2603:10a6:102:2aa::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3cc40f6e-b738-4e9c-b9bd-08da22de0404
X-MS-TrafficTypeDiagnostic: AM5PR0402MB2705:EE_
X-Microsoft-Antispam-PRVS: 
	<AM5PR0402MB2705AA958C2B694FD0F0547FC2F59@AM5PR0402MB2705.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	2+jowZtwWgxCSGVss+JzhpWr30MQMHevYHjnLNrepvGAj5jVV1BTUhVyDsmE56r60oEaFV5cE1PF7zkIf3J/5em5LysTroVArGq3mMh9rWvi1kDq8BSMhYnU0rXUDuW8dzox36lw223YbKC9HDoTywYY8LMopMNDZIuzfXE8h7beWqvW3gB8GmCr0G0NddIhT+S4ofE1GGiI5Ylfu4tYbKNSzwxnl64dSPGPAi4Gb0+7vuWPTdno972IA7SBtnbVfWJ36W+KvhNwlt2mFSz1coCiKmQJFXI8mWQY+ke1cMT/ML7DWbU7E5kgdJQAmadZEtfO6TrRJxgDC0ighxa3i8EnEX5B0ZOzEYJmSfg0ZOnemQtIa+yndZN2dJ7AYTcuTIb7yDamRjl1RxIgTZjC6JogMCbsBb1Ptuc4TKPnemP1wPmuuemNN5+Fhc4U12BPnpeWErYfB8gscwKSibO21qO0TFD8Thh5efe/T8scIgCMpRMr0GQAN23mqgPZImfbqIwKQWI0WSX8q7vGMyGcPnVhw/0XyWp6OTgFdSWT3n7EDmQTa5ar8RPB3a7Cw02L2q54Gl3wjqQ0X+fIlQQ2711jHFvW+VdFHYP1OUkMFo4MrKnL1GgBI5iieMMIBXoclT208aNVSGCrmqyPNW+4G0xwlyHK+u7MfhwD0DR50aNuC2mI2GR+4uyVcO11X1hNNtGAzckfZEZppFQTwTriICuHscUel1H4uVlwo8DPFiw8k0Yr06LB3jr4HG4UQBO2BVdUQWPz8e7eGeLcKoxJKAxhYwAhWkLLsNG48L2w+CGfqWS51cyZYA2nZQo2iXpP
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9367.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(53546011)(5660300002)(6512007)(316002)(6666004)(4326008)(508600001)(6506007)(8676002)(44832011)(966005)(6486002)(8936002)(36756003)(38100700002)(2906002)(186003)(2616005)(86362001)(31696002)(66476007)(66556008)(31686004)(66946007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?NlBIODFrM0RRdjFxdWJRUWVHQ0Rna3piT05FaXlTcWlPbUJBSStORng1eHdJ?=
 =?utf-8?B?U0RpZnFuWnYySEs0UTlwWGZxaEdjVnRVL3paNXVFckYzQUVFYkVPNWxOc3Ew?=
 =?utf-8?B?UWhsdkhyUW0rZzNRWjF4THh3Q1JoczIrOU9FdFovNzZEckgwMC9vYVpheGRN?=
 =?utf-8?B?cVpjbllPb0YrRVBxWktTWGxFRzMydkJIaGpWQ2dqejdybTJxUnIya0psV3hW?=
 =?utf-8?B?Q2lnTytjS0hjcjNVVmVJOWFLaTZDMlV2MlJ2ODBzblNYRDhiNTNDMlVUVTQy?=
 =?utf-8?B?d1U0Wkp0bEVuM2greUhleGZseGNtUjVubGx2V3FQdkY0NWhaWHJOUFBOZzF1?=
 =?utf-8?B?WURiMVJBTEIxd2hZYlF3TDduNTAyazJhQStpVlFtZ1l2RUdTZ0NoMy93TUFq?=
 =?utf-8?B?L1VFK3k5czFVTmFocXpxbEgvMlhtTHRmQkRDRjhSOCtjZUt6V3F3NWRDRTJ5?=
 =?utf-8?B?Q21JUmlPNk5HYTQ5L2VWRjJBYTlOb2xiMlJ1WDE2N3dXaHZlbWNYNCtpOFFT?=
 =?utf-8?B?bmdhQk1CQ2IvTXBnM1RPN0hrd21BMnZQZmt0Uk8wNnNWYTgySGtnd2o1Qlho?=
 =?utf-8?B?QW1LZjFtalFGUlpuOGd3TnRaNk1nNkYxUVRyOWhOUXFvMGtwNHp2STI2cmQz?=
 =?utf-8?B?Y3hlK214UFhOdG9nOXRxdjc4VklmQmRER1JjK05RWVdPL3VyNStQUmxYbFhI?=
 =?utf-8?B?MmhTUytTUG9EMlduTzY0dGF1WjN3eVpBSGlFU0IrbDJRalJTdmg2cXp4dlJ5?=
 =?utf-8?B?dVNQZno1WTJjU0s1dTZwek1iYWVMWWtTM2VOaWxPMXk2ZGg1ZzAwMkt0RUwv?=
 =?utf-8?B?TFQ2V1dabVFUSTd3YmpsSjd1c3ZVSy9WdktMSk5tU3lGRzY1T1U1bUdSU0Nr?=
 =?utf-8?B?Y1dhSGNYbU9iTCtoK3hFS2w3QXJiY0NhUUw2ZjZ1NzdYMW9KMG5xb2NlMkV3?=
 =?utf-8?B?Ymx3RUlETHQrKzlpay9NVjdvZExJZnZMSk4za0I4TGR4SnNLYk5JVXFCY20y?=
 =?utf-8?B?eTRYMlNaQlR1M0xsVzArcVZ5MmRObVpXRjd2RzFFRWM3anlUVjJxL2pUblVN?=
 =?utf-8?B?c2s5Um96MVNPdkFqbHJkYnJPV01FMWF3RS9WTnZZRmZpYzFSWWVuazFuYmts?=
 =?utf-8?B?WVdlTmcxbGpnNmxiZWh1RnMxSnVJQjBjVVFZd0RybnovUGV0c2UwZzgrNXNq?=
 =?utf-8?B?Y3VRcnRFUU5UNm5YLzZBald0MlVBUkpJQjRycjhIK0JLL3ArQnFWT0VodjZY?=
 =?utf-8?B?NlhYTllha0Y4RlQ2bmdQTmFNSWJDWmJjeHJFRVlYY1REbXFmSENyRE45NHNv?=
 =?utf-8?B?ODlkR2Z6R0Y4aU0wOU9oNk81UHRPTWFCWUUxT0dvTXRzc0YvZytYWWdqRkVK?=
 =?utf-8?B?UmUvMFhzbDVPNGlBT0prc2Y5dUttaU5pZ2piczBFQWJOZ241ZnNod3FyZmF3?=
 =?utf-8?B?ZE1LbzYwZzM3MmtMRTFxc3YrWXRpMm96L09LWDdYODJqKzBoMExXWmpjYjI0?=
 =?utf-8?B?T2lDZ3FVN01SdGdSVDJZbnZrTVM4ZE1XZEJqZi93enVVaTZFNGVHZ1FoblZU?=
 =?utf-8?B?WEhOWXJLemlYbURQT29NbmJxOFZmdFpPUmJkc3MxRVRtaHo0dGI3c1A3YU11?=
 =?utf-8?B?eE9ZWXo4TzJMczFKMVpTZUp5azVxL1Z5OThQZmE4Z0tHZDVXU2k2TWFFRm1U?=
 =?utf-8?B?UTdwWFVXb1FlNElCSUd0ek5GeXUwVWl0YkFTRllQMk5zYUlzalZDQ0tMOGhC?=
 =?utf-8?B?MVVFbHN2c0s1T0pldGVqbVI1Wm44MDd2cjd3dEdRSS9HbFl5V3hyK3dpbDds?=
 =?utf-8?B?cjd3UXRVMEN1ZHhyMDBqVHdhb1ZYVTAvV2VUMzhHMlZmUU9tbldtdDhYTjBW?=
 =?utf-8?B?YmxBb05XTzg2VVRWR0pybm8zQzZpRzgwZlBZSi83Um9GZXJpMkVEQlh3ZHI0?=
 =?utf-8?B?c25QV2VleDIyNEVHenZtbmFKZnRYQXdvWTFNT2Q0elcwZTByRnRSdG5COGU0?=
 =?utf-8?B?eXIvRjVjUGpRdkMvL1UySTJ1OXhoRnczbnJ3cks5Z3lCZk1PTXZNVUlueWhM?=
 =?utf-8?B?OHdOL256REFxSG9SeWRGQ3dpREp2TUtwMnByYkNlNE95Tm9GY09XSWQzcTgw?=
 =?utf-8?B?akV1bGlFRkdpYmNxMmtaaDdFTFMzakk1YWtrSWtzNytjS2dwUFBOSXIrYVh5?=
 =?utf-8?B?STMrMkdzTUJuY0paQ1RPTitqQWpYRFlyZ1VvZGdTVWVybXY4ZVBnZVh6bTR3?=
 =?utf-8?B?MWpEcitvZUJWcm9sRkk1ekVlSVZmUExaQ2hrM2l3RDcwNHJ4VWRyckorcDJT?=
 =?utf-8?B?Z0VZUk9RcFV6ZTBiUmhVUHNYbkw4d0RhbmwxK1JMOUVad3hkR2ZiOTNHdWs2?=
 =?utf-8?Q?dTxOEMOk6rDLDMrM5H4RgWn0ruBH1AVXAnZiovKGZJz43?=
X-MS-Exchange-AntiSpam-MessageData-1: pKg+IZ3fSOs2ROO1NusEha8RiIM5Om0VH6E=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 3cc40f6e-b738-4e9c-b9bd-08da22de0404
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9367.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2022 14:56:57.6547
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 Xp3YsTtL3FwDe6m2spNrEsZrgYHYa/NvI4Elzlm5+EPVNvN3uPno5eTwyXTe4+kvZw4/T+fompF6ABkaaoylUS8fr8FvCkcZBdAd/LsO2MZIZXNyZAug8Jq2bVfCk0U0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0402MB2705
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 21 Apr 2022 16:46:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2807

Hi Richard,

On 4/20/22 13:44, Richard Purdie wrote:
> On Wed, 2022-04-20 at 13:24 +0200, Quentin Schulz wrote:
>> From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
>>
>> The switcher expects URL subpath to match the "release" used by sphinx
>> to build the documentation. Branches, however, are put in a subpath
>> after their name (e.g. dunfell) while sphinx sets the "release" to
>> X.Y.999. This means the switcher cannot replace correctly the path to
>> switch between releases/versions.
>>
>> Let set_versions.py inject the list of release names into the
>> switchers.js.in file so it can check whether the subpath is one of the
>> release names in which case it needs to be stripped.
>>
>> Cc: Quentin Schulz <foss+yocto@0leil.net>
>> Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
>> ---
>>   documentation/set_versions.py               |  3 +++
>>   documentation/sphinx-static/switchers.js.in | 12 ++++++++++++
>>   2 files changed, 15 insertions(+)
>>
>> diff --git a/documentation/set_versions.py b/documentation/set_versions.py
>> index dfa2dc269..386cff366 100755
>> --- a/documentation/set_versions.py
>> +++ b/documentation/set_versions.py
>> @@ -203,6 +203,9 @@ versions = []
>>   with open("sphinx-static/switchers.js.in", "r") as r, open("sphinx-static/switchers.js", "w") as w:
>>       lines = r.readlines()
>>       for line in lines:
>> +        if "ALL_VERSIONS_PLACEHOLDER" in line:
>> +            w.write(str(list(release_series.keys())))
>> +            continue
>>           if "VERSIONS_PLACEHOLDER" in line:
>>               w.write("    'dev': { 'title': 'dev (%s)', 'obsolete': false,},\n" % release_series[devbranch])
>>               for branch in activereleases + ([ourseries] if ourseries not in activereleases else []):
>> diff --git a/documentation/sphinx-static/switchers.js.in b/documentation/sphinx-static/switchers.js.in
>> index a44edbcab..2bc18160d 100644
>> --- a/documentation/sphinx-static/switchers.js.in
>> +++ b/documentation/sphinx-static/switchers.js.in
>> @@ -9,6 +9,10 @@ by https://urldefense.proofpoint.com/v2/url?u=https-3A__git.yoctoproject.org_yocto-2Dautobuilder-2Dhelper_tree_scripts_run-2Ddocs-2Db&d=DwICaQ&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=g-IQJeaTqTJrY4BEqvN3SYYzip0oERxzLTCgmnPAx_ep3sLUM64WVRzszk1jAmS4&s=R2xrm2Qom6YqGo2VA3kFxq5WbFofQq4MQ4QnDuOiuIQ&e=
>>   (function() {
>>     'use strict';
>>   
>> +  var all_versions =
>> +	ALL_VERSIONS_PLACEHOLDER
>> +  ;
>> +
>>     var switcher_versions = {
>>       VERSIONS_PLACEHOLDER
>>     };
>> @@ -157,6 +161,14 @@ by https://urldefense.proofpoint.com/v2/url?u=https-3A__git.yoctoproject.org_yocto-2Dautobuilder-2Dhelper_tree_scripts_run-2Ddocs-2Db&d=DwICaQ&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=g-IQJeaTqTJrY4BEqvN3SYYzip0oERxzLTCgmnPAx_ep3sLUM64WVRzszk1jAmS4&s=R2xrm2Qom6YqGo2VA3kFxq5WbFofQq4MQ4QnDuOiuIQ&e=
>>           var new_url = docroot + new_versionpath + url.replace(docroot, "");
>>           var fallback_url = docroot + new_versionpath;
>>       } else {
>> +	// check for named releases (e.g. dunfell) in the subpath
>> +        $.each(all_versions, function(idx, name) {
>> +		if (docroot.endsWith('/' + name + '/')) {
>> +			current_version = name;
>> +			return false;
>> +		}
>> +	});
>> +
>>           var new_url = url.replace('/' + current_version + '/', '/' + new_versionpath);
>>           var fallback_url = new_url.replace(url.replace(docroot, ""), "");
>>       }
> 
> Should this be called "all_releases" or "release_series" instead? It isn't
> really a version list?
> 

It is a list of release names only, of all releases ever published. I 
named it this way in anticipation that we'll need to make this a 
dictionary to store more info later on. all_releases works for me, 
thanks for the suggestion.

Cheers,
Quentin

