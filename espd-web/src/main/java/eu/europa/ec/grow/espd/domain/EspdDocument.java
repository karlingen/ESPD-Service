package eu.europa.ec.grow.espd.domain;

import lombok.Data;
import org.springframework.web.multipart.MultipartFile;

import javax.xml.bind.JAXBException;
import javax.xml.bind.annotation.*;
import java.io.IOException;

@Data
@XmlRootElement(name="xml")
@XmlAccessorType(XmlAccessType.FIELD)
public class EspdDocument {

	@XmlTransient private String action;// "ca_create_espd" or "eo_import_espd"

    private PartyImpl authority;

	@XmlElement private String procedureDesc;
	@XmlElement private String lotConcerned;
	@XmlElement private String fileRefByCA;
	@XmlElement private String websiteProcDocs;
	
	//Exclusions
	
	@XmlElement private CriminalConvictions criminalConvictions;
	@XmlElement private CriminalConvictions corruption;
	@XmlElement private CriminalConvictions fraud;
	@XmlElement private CriminalConvictions terroristOffences;
	@XmlElement private CriminalConvictions moneyLaundering;
	@XmlElement private CriminalConvictions childLabour;
	
	@XmlElement private Taxes paymentTaxes;
	@XmlElement private Taxes paymentSocsec;
	
	@XmlElement private BreachOfObligations breachingObligations;
	@XmlElement private BreachOfObligations bankruptSubject;
	@XmlElement private BreachOfObligations guiltyGrave;
	@XmlElement private BreachOfObligations agreementsEo;
	@XmlElement private BreachOfObligations conflictInterest;
	@XmlElement private BreachOfObligations involvementPreparation;
	@XmlElement private BreachOfObligations earlyTermination;
	@XmlElement private BreachOfObligations guiltyMisinterpretation;

    @XmlElement
    private SelectionCriterion suitabilityEnrolment;

    @XmlElement
    private SelectionCriterion suitabilityServiceContracts;

    @XmlElement
    private SelectionCriterion economicGeneralTurnover;

    @XmlElement
    private SelectionCriterion economicAverageTurnover;

    @XmlElement
    private SelectionCriterion economicEnrolment;

    @XmlElement
    private SelectionCriterion economicServiceContracts;

    @XmlElement
    private Criterion selectionSatisfiesAll;

	//trick to use MultipartFile as @RequestParam
	public void setAttachment(MultipartFile attachment) throws IOException, JAXBException {}
	public MultipartFile getAttachment() {return null;}

}
