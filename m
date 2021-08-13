Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
 by mx.groups.io with SMTP id smtpd.web08.42552.1628888248900144315
 for <docs@lists.yoctoproject.org>;
 Fri, 13 Aug 2021 13:57:29 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ibm.com header.s=pp1 header.b=XPRWzuQ9;
 spf=pass (domain: linux.ibm.com, ip: 148.163.158.5, mailfrom: jrey@linux.ibm.com)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 17DKYKJ0155514;
	Fri, 13 Aug 2021 16:57:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=fmlNbSenK2vnzFYl6KN+KqnoOyjS4fVs7YeCnUUBAtY=;
 b=XPRWzuQ9QdoZh6ThTaA6auBnIii0r6+BUpKYuHCvnQYEf4Ns1HSGvEoDQzOzsT3rg266
 E3ja4RQx1bDm3FO5UkEs893bHGNLarBe2qHK4CMAFnC9DzE0fsCkJeJQxgoqyagKZhhL
 pxyNMjgC6LBbCBvyMEpGbq8ps3VYfvnlMgR69ZAkELhAQHul1lL5t8OxJS6F5qAEVbFm
 4Fj9RcoMFehDmYFgmNVxN/mENVIIDzlwLyRNQg8VgogOMET6AhcHQAZ/Jr+X8vptejCY
 IqptmRS93dCD4Sxvy/WFEod7IS6xy/uOxJNjO+9JLN5kaUX9T08E8mL8XIAtizleSP3c Vg== 
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com [169.55.91.170])
	by mx0a-001b2d01.pphosted.com with ESMTP id 3adu36feub-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Aug 2021 16:57:25 -0400
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
	by ppma02wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 17DKlb03011011;
	Fri, 13 Aug 2021 20:57:25 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
	by ppma02wdc.us.ibm.com with ESMTP id 3aapje4n64-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Aug 2021 20:57:25 +0000
Received: from b03ledav001.gho.boulder.ibm.com (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
	by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 17DKvOsr44368382
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 13 Aug 2021 20:57:24 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0F7A06E053;
	Fri, 13 Aug 2021 20:57:24 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 992636E056;
	Fri, 13 Aug 2021 20:57:23 +0000 (GMT)
Received: from demeter.local (unknown [9.65.123.151])
	by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTPS;
	Fri, 13 Aug 2021 20:57:23 +0000 (GMT)
Subject: Re: [docs] Document Yocto config items (was: Configure command shell idle timeout default?)
To: Michael Opdenacker <michael.opdenacker@bootlin.com>,
        yocto-security@lists.yoctoproject.org,
        Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
References: <1b70ecb4-d1c7-c913-6e84-d70d69baaa7c@linux.ibm.com>
 <3a45d0f8b91c750544e232171c0b8a650ead3889.camel@linuxfoundation.org>
 <298b3fc4-64f7-c70f-4ec6-e9e52ec71a86@kernel.crashing.org>
 <4e7ff3e4-3dca-d140-51b4-340f16fe66a3@linux.ibm.com>
 <7e70596bee4e54bbaf0ab6da36f41957c19a8673.camel@linuxfoundation.org>
 <0acd3699-0c59-79ec-a690-957e6db94ee6@linux.ibm.com>
 <1698752D53722E14.11152@lists.yoctoproject.org>
 <59a1fefa-98b6-5dc5-2464-c2910fdefd9b@bootlin.com>
From: "Joseph Reynolds" <jrey@linux.ibm.com>
Message-ID: <38346ae4-0f79-2162-ff6c-2a74ec639b54@linux.ibm.com>
Date: Fri, 13 Aug 2021 15:57:22 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.1
In-Reply-To: <59a1fefa-98b6-5dc5-2464-c2910fdefd9b@bootlin.com>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: ealolIRMJ3aMth3mo8HjqbJh8kvoY3DZ
X-Proofpoint-GUID: ealolIRMJ3aMth3mo8HjqbJh8kvoY3DZ
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.790
 definitions=2021-08-13_08:2021-08-13,2021-08-13 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 adultscore=0 lowpriorityscore=0 mlxscore=0 impostorscore=0 spamscore=0
 suspectscore=0 malwarescore=0 clxscore=1011 mlxlogscore=999 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108130119
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-001b2d01.pphosted.com id 17DKYKJ0155514
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 8/13/21 5:30 AM, Michael Opdenacker wrote:
> Hi Joseph,
>
> On 8/5/21 6:14 PM, Michael Opdenacker wrote:
>>
>> Many for your suggestions !
>> I'm copying our docs mailing list so that this topic gets tracked
>> properly and other people can contribute.
>>
>> I should be able to get back to you next week.
>
> Unfortunately, the week was busier than expected and I won't be able to
> work on this before September.
> I filed a new bug so that we track this task properly:
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D14509

Thank you.=C2=A0 Getting this started sometime this year would be fantast=
ic!=C2=A0=20
Please ping me directly.

I've added a link from the OpenBMC project configuration guide to your=20
Yocto work item, so we can track progress.

Joseph

>
> Don't hesitate to subscribe to the bug.
> I'll post updates through this thread anyway.
>
> Cheers,
> Michael.
>

